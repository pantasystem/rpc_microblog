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

func (r *AccountRepositoryImpl) Create(ctx context.Context, account *entity.Account) (*entity.Account, error) {
	result := r.Db.Create(account)
	if result.Error != nil {
		return nil, result.Error
	}
	return r.FindByID(ctx, account.Id)
}

func (r *AccountRepositoryImpl) FindByID(ctx context.Context, id uuid.UUID) (*entity.Account, error) {
	var account entity.Account
	result := r.Db.First(&account, id)
	if result.Error != nil {
		return nil, result.Error
	}
	return &account, nil
}

func (r *AccountRepositoryImpl) FindByToken(ctx context.Context, token string) (*entity.Account, error) {
	var account entity.Account
	result := r.Db.First(&account, "token = ?", token)
	if result.Error != nil {
		return nil, result.Error
	}
	return &account, nil
}

func (r *AccountRepositoryImpl) Delete(ctx context.Context, id uuid.UUID) error {
	result := r.Db.Delete(&entity.Account{}, id)
	if result.Error != nil {
		return result.Error
	}
	return nil
}
