package entity

import (
	"time"

	"github.com/google/uuid"
)

type Reaction struct {
	Id            uuid.UUID `gorm:"primaryKey"`
	AccountId     string    `gorm:"index"`
	Account       *Account  `gorm:"foreignKey:AccountId"`
	StatusId      string    `gorm:"index"`
	Status        *Status   `gorm:"foreignKey:StatusId"`
	Type          string    `gorm:"type:varchar(255)"`
	CustomEmojiId *uuid.UUID
	CustomEmoji   *CustomEmoji `gorm:"foreignKey:CustomEmojiId"`
	CreatedAt     time.Time
	UpdatedAt     time.Time
}