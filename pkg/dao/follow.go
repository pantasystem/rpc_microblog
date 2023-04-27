package dao

import (
	"context"

	"github.com/google/uuid"
	"gorm.io/gorm"
	"systems.panta/rpc-microblog/pkg/entity"
)

type FollowRepositoryImpl struct {
	Db *gorm.DB
}

func (r *FollowRepositoryImpl) Create(ctx context.Context, f *entity.Follow) (*entity.Follow, error) {
	result := r.Db.Create(f)
	if result.Error != nil {
		return nil, result.Error
	}
	return r.FindById(ctx, f.Id)
}

func (r *FollowRepositoryImpl) Delete(ctx context.Context, f *entity.Follow) error {
	result := r.Db.Delete(&entity.Follow{}, f.Id)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (r *FollowRepositoryImpl) FindByFollowTargetAccountId(ctx context.Context, followerId uuid.UUID) ([]*entity.Follow, error) {
	var follows []*entity.Follow
	result := r.Db.Model(&entity.Follow{}).Where("target_account_id = ?", followerId).Find(&follows)
	if result.Error != nil {
		return nil, result.Error
	}
	return follows, nil
}

func (r *FollowRepositoryImpl) FindByAccountId(ctx context.Context, accountId uuid.UUID) ([]*entity.Follow, error) {
	var follows []*entity.Follow
	result := r.Db.Model(&entity.Follow{}).Where("account_id = ?", accountId).Find(&follows)
	if result.Error != nil {
		return nil, result.Error
	}
	return follows, nil
}

func (r *FollowRepositoryImpl) FindById(ctx context.Context, id uuid.UUID) (*entity.Follow, error) {
	var follow entity.Follow
	result := r.Db.First(&follow, id)
	if result.Error != nil {
		return nil, result.Error
	}
	return &follow, nil
}

func (r *FollowRepositoryImpl) FindByFollowTargetAccountIdAndAccountId(ctx context.Context, targetAccountId uuid.UUID, accountId uuid.UUID) ([]*entity.Follow, error) {
	var follows []*entity.Follow
	result := r.Db.Model(&entity.Follow{}).Where("target_account_id = ? AND account_id = ?", targetAccountId, accountId).Find(&follows)
	if result.Error != nil {
		return nil, result.Error
	}
	return follows, nil
}
