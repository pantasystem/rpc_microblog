package handler

import (
	"context"
	"fmt"

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
		fmt.Printf("follow: %+v\n", err)
		return nil, err
	}
	ar, err := r.Module.ServiceModule().AccountRelationshipService().FindBy(ctx, cUuid, aId)
	if err != nil {
		return nil, err
	}
	return &proto.AccountRelationship{
		IsFollowing: ar.IsFollowing,
		AccountId:   aId.String(),
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

func (r *FollowService) GetFollows(ctx context.Context, req *proto.GetFollowsRequest) (*proto.FollowsResponse, error) {
	aId, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, err
	}

	follows, err := r.Module.RepositoryModule().FollowRepository().FindByAccountId(ctx, aId)
	if err != nil {
		return nil, err
	}
	protoFollows := make([]*proto.Follow, len(follows))
	for i, f := range follows {
		protoFollows[i] = &proto.Follow{
			TargetAccount: &proto.Account{
				Id:             f.TargetAccount.Id.String(),
				Name:           f.TargetAccount.Name,
				AvatarUrl:      *f.TargetAccount.AvatarUrl,
				FollowerCount:  f.TargetAccount.FollowerCount,
				FollowingCount: f.TargetAccount.FollowingCount,
				PostCount:      f.TargetAccount.PostCount,
			},
			Account: &proto.Account{
				Id:             f.Account.Id.String(),
				Name:           f.Account.Name,
				AvatarUrl:      *f.Account.AvatarUrl,
				FollowerCount:  f.Account.FollowerCount,
				FollowingCount: f.Account.FollowingCount,
				PostCount:      f.Account.PostCount,
			},
		}
	}
	return &proto.FollowsResponse{
		Follows: protoFollows,
	}, nil
}

func (r *FollowService) GetFollowers(ctx context.Context, req *proto.GetFollowersRequest) (*proto.FollowsResponse, error) {
	aId, err := uuid.Parse(req.AccountId)
	if err != nil {
		return nil, err
	}

	followers, err := r.Module.RepositoryModule().FollowRepository().FindByFollowTargetAccountId(ctx, aId)
	if err != nil {
		return nil, err
	}
	protoFollowers := make([]*proto.Follow, len(followers))
	for i, f := range followers {
		protoFollowers[i] = &proto.Follow{
			TargetAccount: &proto.Account{
				Id:             f.TargetAccount.Id.String(),
				Name:           f.TargetAccount.Name,
				AvatarUrl:      *f.TargetAccount.AvatarUrl,
				FollowerCount:  f.TargetAccount.FollowerCount,
				FollowingCount: f.TargetAccount.FollowingCount,
				PostCount:      f.TargetAccount.PostCount,
			},
			Account: &proto.Account{
				Id:             f.Account.Id.String(),
				Name:           f.Account.Name,
				AvatarUrl:      *f.Account.AvatarUrl,
				FollowerCount:  f.Account.FollowerCount,
				FollowingCount: f.Account.FollowingCount,
				PostCount:      f.Account.PostCount,
			},
		}
	}
	return &proto.FollowsResponse{
		Follows: protoFollowers,
	}, nil
}
