package service

import (
	"context"

	"github.com/google/uuid"
	"systems.panta/rpc-microblog/pkg/repository"
)

type AccountRelationship struct {
	IsFollowing bool `json:"is_following"`
}

type AccountRelationshipService struct {
	AR repository.AccountRepository
	FR repository.FollowRepository
}

func (r *AccountRelationshipService) FindBy(ctx context.Context, accountId uuid.UUID, targetId uuid.UUID) (*AccountRelationship, error) {
	follows, err := r.FR.FindByFollowerIdAndAccountId(ctx, accountId, targetId)
	if err != nil {
		return nil, err
	}
	return &AccountRelationship{
		IsFollowing: len(follows) > 0,
	}, nil
}
