package handler

import (
	"context"
	"fmt"

	"github.com/google/uuid"
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
	res, err := r.Module.RepositoryModule().StatusRepository().FindByAccountId(ctx, aUuid, q)
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
