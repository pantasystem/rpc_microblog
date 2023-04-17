package dao

import (
	"context"

	"gorm.io/gorm"
	"systems.panta/rpc-microblog/pkg/entity"
)

type CustomEmojiRepositoryImpl struct {
	Db *gorm.DB
}

func (r *CustomEmojiRepositoryImpl) FindAll(ctx context.Context) ([]*entity.CustomEmoji, error) {
	var emojis *[]*entity.CustomEmoji
	result := r.Db.Find(emojis)
	if result.Error != nil {
		return nil, result.Error
	}
	return *emojis, nil
}

func (r *CustomEmojiRepositoryImpl) Create(ctx context.Context, customEmoji *entity.CustomEmoji) (*entity.CustomEmoji, error) {
	result := r.Db.Create(customEmoji)
	if result.Error != nil {
		return nil, result.Error
	}
	return customEmoji, nil
}

func (r *CustomEmojiRepositoryImpl) Delete(ctx context.Context, customEmoji *entity.CustomEmoji) error {
	result := r.Db.Delete(&entity.CustomEmoji{}, customEmoji.Id)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (r *CustomEmojiRepositoryImpl) FindByName(ctx context.Context, name string) ([]*entity.CustomEmoji, error) {
	var emojis []*entity.CustomEmoji
	result := r.Db.Model(&entity.CustomEmoji{}).Where("name = ?", name).Find(&emojis)
	if result.Error != nil {
		return nil, result.Error
	}
	return emojis, nil
}
