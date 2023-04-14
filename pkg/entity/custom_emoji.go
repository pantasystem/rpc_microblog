package entity

import "time"

type CustomEmoji struct {
	Id        string `gorm:"primaryKey"`
	Type      string `gorm:"type:varchar(255)"`
	EmojiUrl  string `gorm:"type:varchar(255)"`
	Width     int
	Height    int
	CreatedAt time.Time
	UpdatedAt time.Time
}
