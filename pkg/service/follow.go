package service

import (
	"context"

	"github.com/google/uuid"
	"systems.panta/rpc-microblog/pkg/entity"
	"systems.panta/rpc-microblog/pkg/repository"
)

type FollowService struct {
	FR repository.FollowRepository
}

func (r *FollowService) ToggleFollow(ctx context.Context, targetId uuid.UUID, followerId uuid.UUID) error {
	follows, err := r.FR.FindByFollowerIdAndAccountId(ctx, followerId, targetId)
	if err != nil {
		return err
	}
	if len(follows) > 0 {
		return r.FR.Delete(ctx, follows[0])
	} else {
		_, err := r.FR.Create(ctx, &entity.Follow{
			AccountId: targetId,
			FollowId:  followerId,
		})
		return err
	}
}
