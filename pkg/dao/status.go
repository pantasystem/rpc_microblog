package dao

import (
	"context"
	"errors"
	"fmt"

	"github.com/google/uuid"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
	"systems.panta/rpc-microblog/pkg/entity"
	"systems.panta/rpc-microblog/pkg/event"
	"systems.panta/rpc-microblog/pkg/repository"
)

type StatusRepositoryImpl struct {
	Db                 *gorm.DB
	StatusEventManager *event.StatusEventManager
}

func (r *StatusRepositoryImpl) Create(ctx context.Context, status *entity.Status) (*entity.Status, error) {
	result := r.Db.Create(status)
	if result.Error != nil {
		return nil, result.Error
	}
	result = r.Db.Model(&entity.Account{}).
		Where("id = ?", status.AccountId).
		Update("post_count", gorm.Expr("post_count + ?", 1))
	if result.Error != nil {
		return nil, result.Error
	}

	newPost, err := r.FindById(ctx, status.Id)
	if err != nil {
		return nil, err
	}

	r.StatusEventManager.PublishEvent(&event.StatusEvent{
		EventType: event.StatusCreate,
		Post:      newPost,
	})

	return newPost, nil
}

func (r *StatusRepositoryImpl) Delete(ctx context.Context, status *entity.Status) error {
	result := r.Db.Delete(&entity.Status{}, status.Id)
	if result.Error != nil {
		return result.Error
	}

	result = r.Db.Model(&entity.Account{}).
		Where("id = ?", status.AccountId).
		Update("post_count", gorm.Expr("post_count - ?", 1))
	if result.Error != nil {
		return result.Error
	}
	r.StatusEventManager.PublishEvent(
		&event.StatusEvent{
			EventType: event.StatusDelete,
			Post:      status,
		},
	)
	return nil
}

func (r *StatusRepositoryImpl) FindById(ctx context.Context, id uuid.UUID) (*entity.Status, error) {
	var status entity.Status
	result := r.Db.Preload("Reactions.CustomEmoji").
		Preload("Reblog.Account").
		Preload("Reply.Account").
		Preload("Reblog.Reactions").
		Preload("Reply.Reactions").
		Preload(clause.Associations).
		First(&status, id)
	if result.Error != nil {
		return nil, result.Error
	}
	return &status, nil
}

func (r *StatusRepositoryImpl) FindByFollowedAccount(ctx context.Context, accountId uuid.UUID, query *repository.FindByFollowedAccountQuery) ([]*entity.Status, error) {
	var statuses []*entity.Status
	fmt.Printf("query: %+v\n", query)

	var statusByMaxId *entity.Status
	var statusByMinId *entity.Status
	if query.MaxId != nil {
		res := r.Db.First(&statusByMaxId, query.MaxId)
		if res.Error != nil && !errors.Is(res.Error, gorm.ErrRecordNotFound) {
			fmt.Printf("fetch status filter by maxId: %+v\n", res.Error)
			return nil, res.Error
		}
	}
	if query.MinId != nil {
		res := r.Db.First(&statusByMinId, "id = ?", query.MinId)
		if res.Error != nil && !errors.Is(res.Error, gorm.ErrRecordNotFound) {
			fmt.Printf("error: %+v\n", res.Error)
			return nil, res.Error
		}
	}
	q := r.Db.Model(&entity.Status{}).Joins("LEFT JOIN follows ON follows.target_account_id = statuses.account_id").
		Where("follows.account_id = ?", accountId).
		Or("statuses.account_id = ?", accountId)

	if statusByMaxId != nil {
		q = q.Where("statuses.created_at < ?", statusByMaxId.CreatedAt)
	}
	if statusByMinId != nil {
		q = q.Where("statuses.created_at > ?", statusByMinId.CreatedAt)
	}

	res := q.Preload("Reactions.CustomEmoji").
		Preload("Reblog.Account").
		Preload("Reply.Account").
		Preload("Reblog.Reactions").
		Preload("Reply.Reactions").
		Preload(clause.Associations).
		Order("statuses.created_at DESC").
		Limit(20).Find(&statuses)
	if res.Error != nil {
		fmt.Printf("error: %+v\n", res.Error)
		return nil, res.Error
	}

	fmt.Printf("rdbからの取得に成功しました\n")
	return statuses, nil
}

func (r *StatusRepositoryImpl) FindByAccountId(ctx context.Context, accountId uuid.UUID, query *repository.FindByAccountQuery) ([]*entity.Status, error) {
	var statuses []*entity.Status
	fmt.Printf("query: %+v\n", query)

	var statusByMaxId *entity.Status
	var statusByMinId *entity.Status
	if query.MaxId != nil {
		res := r.Db.First(&statusByMaxId, query.MaxId)
		if res.Error != nil && !errors.Is(res.Error, gorm.ErrRecordNotFound) {
			fmt.Printf("fetch status filter by maxId: %+v\n", res.Error)
			return nil, res.Error
		}
	}
	if query.MinId != nil {
		res := r.Db.First(&statusByMinId, "id = ?", query.MinId)
		if res.Error != nil && !errors.Is(res.Error, gorm.ErrRecordNotFound) {
			fmt.Printf("error: %+v\n", res.Error)
			return nil, res.Error
		}
	}
	q := r.Db.Model(&entity.Status{}).
		Where("statuses.account_id = ?", accountId)

	if statusByMaxId != nil {
		q = q.Where("statuses.created_at < ?", statusByMaxId.CreatedAt)
	}
	if statusByMinId != nil {
		q = q.Where("statuses.created_at > ?", statusByMinId.CreatedAt)
	}

	res := q.Preload("Reactions.CustomEmoji").
		Preload("Reblog.Account").
		Preload("Reply.Account").
		Preload("Reblog.Reactions").
		Preload("Reply.Reactions").
		Preload(clause.Associations).
		Order("statuses.created_at DESC").
		Limit(20).Find(&statuses)
	if res.Error != nil {
		fmt.Printf("error: %+v\n", res.Error)
		return nil, res.Error
	}

	fmt.Printf("rdbからの取得に成功しました\n")
	return statuses, nil
}
