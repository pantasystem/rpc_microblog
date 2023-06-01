package dao

import (
	"context"
	"fmt"

	"github.com/google/uuid"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
	"systems.panta/rpc-microblog/pkg/entity"
)

type FollowRepositoryImpl struct {
	Db *gorm.DB
}

func (r *FollowRepositoryImpl) Create(ctx context.Context, f *entity.Follow) (*entity.Follow, error) {
	result := r.Db.Create(f)
	if result.Error != nil {
		fmt.Printf("create follow error: %+v\n", result.Error)
		return nil, result.Error
	}
	result = r.Db.Model(&entity.Account{}).Where("id = ?", f.AccountId).
		Update("following_count", gorm.Expr("following_count + ?", 1))
	if result.Error != nil {
		fmt.Printf("update following count error: %+v\n", result.Error)
		return nil, result.Error
	}
	result = r.Db.Model(&entity.Account{}).Where("id = ?", f.TargetAccountId).
		Update("follower_count", gorm.Expr("follower_count + ?", 1))
	if result.Error != nil {
		fmt.Printf("update follower count error: %+v\n", result.Error)
		return nil, result.Error
	}

	fmt.Printf("follow created: %+v\n", f)
	return r.FindById(ctx, f.Id)
}

func (r *FollowRepositoryImpl) Delete(ctx context.Context, f *entity.Follow) error {
	result := r.Db.Delete(&entity.Follow{}, f.Id)
	if result.Error != nil {
		return result.Error
	}
	result = r.Db.Model(&entity.Account{}).Where("id = ?", f.AccountId).
		Update("following_count", gorm.Expr("following_count - ?", 1))
	if result.Error != nil {
		return result.Error
	}
	result = r.Db.Model(&entity.Account{}).Where("id = ?", f.TargetAccountId).
		Update("follower_count", gorm.Expr("follower_count - ?", 1))
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (r *FollowRepositoryImpl) FindByFollowTargetAccountId(ctx context.Context, followerId uuid.UUID) ([]*entity.Follow, error) {
	var follows []*entity.Follow
	result := r.Db.Model(&entity.Follow{}).Where("target_account_id = ?", followerId).
		Preload(clause.Associations).
		Find(&follows)
	if result.Error != nil {
		return nil, result.Error
	}
	return follows, nil
}

func (r *FollowRepositoryImpl) FindByAccountId(ctx context.Context, accountId uuid.UUID) ([]*entity.Follow, error) {
	var follows []*entity.Follow
	result := r.Db.Model(&entity.Follow{}).Where("account_id = ?", accountId).
		Preload(clause.Associations).
		Find(&follows)
	if result.Error != nil {
		return nil, result.Error
	}
	return follows, nil
}

func (r *FollowRepositoryImpl) FindById(ctx context.Context, id uuid.UUID) (*entity.Follow, error) {
	var follow entity.Follow
	result := r.Db.Preload(clause.Associations).First(&follow, id)
	if result.Error != nil {
		fmt.Printf("fetch follow by id: %v\n", result.Error)
		return nil, result.Error
	}
	fmt.Printf("follow fetched: %+v\n", follow)
	return &follow, nil
}

func (r *FollowRepositoryImpl) FindByFollowTargetAccountIdAndAccountId(ctx context.Context, targetAccountId uuid.UUID, accountId uuid.UUID) ([]*entity.Follow, error) {
	var follows []*entity.Follow
	result := r.Db.Model(&entity.Follow{}).Where("target_account_id = ? AND account_id = ?", targetAccountId, accountId).
		Preload(clause.Associations).
		Find(&follows)
	if result.Error != nil {
		return nil, result.Error
	}
	return follows, nil
}
