package repository

import (
	"context"

	"github.com/google/uuid"
	"systems.panta/rpc-microblog/pkg/entity"
)

type StatusRepository interface {
	Create(context.Context, *entity.Status) (*entity.Status, error)
	Delete(context.Context, *entity.Status) error
	FindById(context.Context, uuid.UUID) (*entity.Status, error)
	FindByFollowedAccount(context.Context, uuid.UUID, *FindByFollowedAccountQuery) ([]*entity.Status, error)
	FindByAccountId(context.Context, uuid.UUID, *FindByAccountQuery) ([]*entity.Status, error)
}

type FindByFollowedAccountQuery struct {
	MaxId *uuid.UUID
	MinId *uuid.UUID
}

type FindByAccountQuery struct {
	MaxId *uuid.UUID
	MinId *uuid.UUID
}
