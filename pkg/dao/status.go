package dao

import (
	"context"

	"github.com/google/uuid"
	"gorm.io/gorm"
	"systems.panta/rpc-microblog/pkg/entity"
	"systems.panta/rpc-microblog/pkg/repository"
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
	result := r.Db.Preload(
		"Account",
		"Reactions",
		"Reactions.CustomEmoji",
		"Reblog.Account",
		"Reblog.Reactions",
		"Reblog.Reactions.CustomEmoji",
		"Reply",
		"Reply.Account",
		"Reply.Reactions",
		"Reply.Reactions.CustomEmoji",
	).First(&status, id)
	if result.Error != nil {
		return nil, result.Error
	}
	return &status, nil
}

func (r *StatusRepositoryImpl) FindByFollowedAccount(ctx context.Context, accountId uuid.UUID, query *repository.FindByFollowedAccountQuery) ([]*entity.Status, error) {
	var statuses []*entity.Status

	var statusByMaxId *entity.Status
	var statusByMinId *entity.Status
	if query.MaxId != nil {
		res := r.Db.First(statusByMaxId, "id = ?", query.MaxId)
		if res.Error != nil {
			return nil, res.Error
		}
	}
	if query.MinId != nil {
		res := r.Db.First(statusByMinId, "id = ?", query.MinId)
		if res.Error != nil {
			return nil, res.Error
		}
	}
	q := r.Db.Model(&entity.Status{}).Joins("INNER JOIN follows ON follows.account_id = statuses.account_id").
		Where("follows.follow_id = ?", accountId)

	if statusByMaxId != nil {
		q = q.Where("statuses.created_at < ?", statusByMaxId.CreatedAt)
	}
	if statusByMinId != nil {
		q = q.Where("statuses.created_at > ?", statusByMinId.CreatedAt)
	}

	res := q.Preload(
		"Account",
		"Reactions",
		"Reactions.CustomEmoji",
		"Reblog.Account",
		"Reblog.Reactions",
		"Reblog.Reactions.CustomEmoji",
		"Reply",
		"Reply.Account",
		"Reply.Reactions",
		"Reply.Reactions.CustomEmoji",
	).Limit(20).Find(&statuses)
	if res.Error != nil {
		return nil, res.Error
	}

	return statuses, nil
}