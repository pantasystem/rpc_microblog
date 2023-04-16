package repository

import (
	"context"

	"systems.panta/rpc-microblog/pkg/entity"
)

type CustomEmojiRepository interface {
	FindAll() (context.Context, []*entity.CustomEmoji, error)
	Create(context.Context, *entity.CustomEmoji) (*entity.CustomEmoji, error)
	Delete(context.Context, *entity.CustomEmoji) error
	FindByName(context.Context, string) (*entity.CustomEmoji, error)
}
