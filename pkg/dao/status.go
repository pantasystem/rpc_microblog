package dao

import (
	"context"

	"github.com/google/uuid"
	"gorm.io/gorm"
	"systems.panta/rpc-microblog/pkg/entity"
)

type StatusRepositoryImpl struct {
	Db *gorm.DB
}

func (r *StatusRepositoryImpl) Create(ctx context.Context, status *entity.Status) (*entity.Status, error) {
	result := r.Db.Create(status)
	if result.Error != nil {
		return nil, result.Error
	}
	return r.FindById(ctx, status.Id)
}

func (r *StatusRepositoryImpl) Delete(ctx context.Context, status *entity.Status) error {
	result := r.Db.Delete(&entity.Status{}, status.Id)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (r *StatusRepositoryImpl) FindById(ctx context.Context, id uuid.UUID) (*entity.Status, error) {
	var status entity.Status
	result := r.Db.First(&status, id)
	if result.Error != nil {
		return nil, result.Error
	}
	return &status, nil
}
