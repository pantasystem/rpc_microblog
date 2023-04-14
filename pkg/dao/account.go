package dao

import (
	"context"

	"github.com/google/uuid"
	"gorm.io/gorm"
	"systems.panta/rpc-microblog/pkg/entity"
)

type AccountRepositoryImpl struct {
	Db *gorm.DB
}

func (r *AccountRepositoryImpl) Create(context.Context, *entity.Account) (*entity.Account, error) {
	return nil, nil
}

func (r *AccountRepositoryImpl) FindByID(context.Context, uuid.UUID) (*entity.Account, error) {
	return nil, nil
}

func (r *AccountRepositoryImpl) FindByToken(context.Context, string) (*entity.Account, error) {
	return nil, nil
}

func (r *AccountRepositoryImpl) Delete(context.Context, uuid.UUID) error {
	return nil
}
