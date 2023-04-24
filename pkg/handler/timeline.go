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
	return &proto.TimelineResponse{
		Statuses: protoStatuses,
	}, nil
}
