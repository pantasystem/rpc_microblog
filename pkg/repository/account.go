package repository

import (
	"context"

	"github.com/google/uuid"
	"systems.panta/rpc-microblog/pkg/entity"
)

type AccountRepository interface {
	Create(context.Context, *entity.Account) (*entity.Account, error)
	FindByID(context.Context, uuid.UUID) (*entity.Account, error)
	FindByToken(context.Context, string) (*entity.Account, error)
	Delete(context.Context, uuid.UUID) error
	Search(context.Context, string) ([]*entity.Account, error)
}
