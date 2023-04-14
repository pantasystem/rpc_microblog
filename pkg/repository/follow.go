package repository

import (
	"context"

	"github.com/google/uuid"
	"systems.panta/rpc-microblog/pkg/entity"
)

type FollowRepository interface {
	Create(context.Context, *entity.Follow) (*entity.Follow, error)
	Delete(context.Context, *entity.Follow) error
	FindByFollowerId(context.Context, uuid.UUID) (*entity.Follow, error)
	FindByAccountId(context.Context, uuid.UUID) (*entity.Follow, error)
	FindById(context.Context, uuid.UUID) (*entity.Follow, error)
}
