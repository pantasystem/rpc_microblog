package entity

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type CustomEmoji struct {
	Id        uuid.UUID `gorm:"primaryKey"`
	Type      string    `gorm:"type:varchar(255)"`
	EmojiUrl  string    `gorm:"type:varchar(255)"`
	Width     int
	Height    int
	CreatedAt time.Time
	UpdatedAt time.Time
}

func (r *CustomEmoji) BeforeCreate(tx *gorm.DB) (err error) {
	uuid, err := uuid.NewRandom()
	if err != nil {
		return err
	}
	r.Id = uuid
	return nil
}
