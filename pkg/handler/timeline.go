package handler

import (
	"context"
	"fmt"

	"github.com/google/uuid"
	"systems.panta/rpc-microblog/pkg/event"
	"systems.panta/rpc-microblog/pkg/handler/proto"
	"systems.panta/rpc-microblog/pkg/module"
	"systems.panta/rpc-microblog/pkg/repository"
)

type TimelienService struct {
	Module module.Module
	proto.UnimplementedTimelineServiceServer
}

func (r *TimelienService) GetTimeline(ctx context.Context, req *proto.TimelineRequest) (*proto.TimelineResponse, error) {
	aId, ok := ctx.Value(AccountId).(string)
	if !ok {
		return nil, fmt.Errorf("account id not found")
	}
	aUuid, err := uuid.Parse(aId)
	if err != nil {
		return nil, err
	}
	q := &repository.FindByFollowedAccountQuery{}
	if req.MaxId != nil {
		maxId, err := uuid.Parse(*req.MaxId)
		if err == nil {
			q.MaxId = &maxId
		}
	}
	if req.MinId != nil {
		minId, err := uuid.Parse(*req.MinId)
		if err == nil {
			q.MinId = &minId
		}
	}
	res, err := r.Module.RepositoryModule().StatusRepository().FindByFollowedAccount(ctx, aUuid, q)
	if err != nil {
		return nil, err
	}
	protoStatuses := make([]*proto.Status, len(res))
	for i, s := range res {
		protoStatuses[i] = ConvertToProtoModel(s, &aUuid)
	}
	tr := &proto.TimelineResponse{
		Statuses: protoStatuses,
	}

	if len(res) > 0 {
		nmiId := res[0].Id.String()
		tr.NextMinId = &nmiId
		nmaId := res[len(res)-1].Id.String()
		tr.NextMaxId = &nmaId
	}

	return tr, nil
}

func (r *TimelienService) GetAccountTimeline(ctx context.Context, in *proto.AccountTimelineRequest) (*proto.TimelineResponse, error) {
	aId, ok := ctx.Value(AccountId).(string)
	if !ok {
		return nil, fmt.Errorf("account id not found")
	}
	aUuid, err := uuid.Parse(aId)
	if err != nil {
		fmt.Printf("parse accountId error: %+v\n", err)
		return nil, err
	}
	q := &repository.FindByAccountQuery{}
	if in.MaxId != nil {
		maxId, err := uuid.Parse(*in.MaxId)
		if err == nil {
			q.MaxId = &maxId
		}
	}
	if in.MinId != nil {
		minId, err := uuid.Parse(*in.MinId)
		if err == nil {
			q.MinId = &minId
		}
	}
	targetId, err := uuid.Parse(in.AccountId)
	if err != nil {
		fmt.Printf("parse targetId error: %+v\n", err)
		return nil, err
	}

	res, err := r.Module.RepositoryModule().StatusRepository().FindByAccountId(ctx, targetId, q)
	if err != nil {
		fmt.Printf("find by account id error: %+v\n", err)
		return nil, err
	}
	protoStatuses := make([]*proto.Status, len(res))
	for i, s := range res {
		protoStatuses[i] = ConvertToProtoModel(s, &aUuid)
	}
	tr := &proto.TimelineResponse{
		Statuses: protoStatuses,
	}

	if len(res) > 0 {
		nmiId := res[0].Id.String()
		tr.NextMinId = &nmiId
		nmaId := res[len(res)-1].Id.String()
		tr.NextMaxId = &nmaId
	}
	fmt.Printf("count: %d\n", len(res))

	return tr, nil

}

func (r *TimelienService) ObserveTimeline(req *proto.StreamTimelineRequest, sv proto.TimelineService_ObserveTimelineServer) error {
	ac, err := r.Module.RepositoryModule().AccountRepository().FindByToken(sv.Context(), req.Token)
	if err != nil {
		return err
	}

	aUuid := ac.Id
	if err != nil {
		fmt.Printf("parse accountId error: %+v\n", err)
		return err
	}
	clientId := uuid.New().String()

	client := event.StatusClient{
		EventChannel: make(chan *event.StatusEvent),
	}
	r.Module.EventModule().StatusEventManager().Register(clientId, &client)

	go func() {
		for ev := range client.EventChannel {
			if ev.EventType == event.StatusCreate {
				_, err := r.Module.RepositoryModule().FollowRepository().FindByFollowTargetAccountIdAndAccountId(
					sv.Context(),
					aUuid,
					ev.Post.AccountId,
				)
				if err != nil {
					continue
				}

				if err := sv.Send(ConvertToProtoModel(ev.Post, &aUuid)); err != nil {
					fmt.Printf("send error: %+v\n", err)
					return
				}
			}

		}
	}()
	<-sv.Context().Done()

	r.Module.EventModule().StatusEventManager().Unregister(clientId)
	close(client.EventChannel)
	return nil
}
