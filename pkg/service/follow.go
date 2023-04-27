package service

import (
	"context"
	"errors"
	"fmt"

	"github.com/google/uuid"
	"gorm.io/gorm"
	"systems.panta/rpc-microblog/pkg/entity"
	"systems.panta/rpc-microblog/pkg/repository"
)

type FollowService struct {
	FR repository.FollowRepository
}

func (r *FollowService) ToggleFollow(ctx context.Context, targetId uuid.UUID, followerId uuid.UUID) error {
	follows, err := r.FR.FindByFollowTargetAccountIdAndAccountId(ctx, targetId, followerId)
	if err != nil && !errors.Is(err, gorm.ErrRecordNotFound) {
		fmt.Printf("fetch follow: %+v\n", err)
		return err
	}
	if len(follows) > 0 {
		return r.FR.Delete(ctx, follows[0])
	} else {
		_, err := r.FR.Create(ctx, &entity.Follow{
			AccountId:       followerId,
			TargetAccountId: targetId,
		})
		return err
	}
}
