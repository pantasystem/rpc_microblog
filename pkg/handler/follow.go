package handler

import (
	"context"

	"github.com/google/uuid"
	"systems.panta/rpc-microblog/pkg/handler/proto"
	"systems.panta/rpc-microblog/pkg/module"
)

type FollowService struct {
	Module module.Module
	proto.UnimplementedFollowServiceServer
}

func (r *FollowService) Follow(ctx context.Context, req *proto.FollowRequest) (*proto.AccountRelationship, error) {
	cId := ctx.Value(AccountId).(string)
	cUuid, err := uuid.Parse(cId)
	if err != nil {
		return nil, err
	}

	aId, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, err
	}

	err = r.Module.ServiceModule().FollowService().ToggleFollow(ctx, aId, cUuid)
	if err != nil {
		return nil, err
	}
	ar, err := r.Module.ServiceModule().AccountRelationshipService().FindBy(ctx, cUuid, aId)
	if err != nil {
		return nil, err
	}
	return &proto.AccountRelationship{
		IsFollowing: ar.IsFollowing,
	}, nil
}

func (r *FollowService) UnFollow(ctx context.Context, req *proto.UnFollowRequest) (*proto.AccountRelationship, error) {
	cId := ctx.Value(AccountId).(string)
	cUuid, err := uuid.Parse(cId)
	if err != nil {
		return nil, err
	}

	aId, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, err
	}

	err = r.Module.ServiceModule().FollowService().ToggleFollow(ctx, aId, cUuid)
	if err != nil {
		return nil, err
	}
	ar, err := r.Module.ServiceModule().AccountRelationshipService().FindBy(ctx, cUuid, aId)
	if err != nil {
		return nil, err
	}
	return &proto.AccountRelationship{
		IsFollowing: ar.IsFollowing,
	}, nil
}
