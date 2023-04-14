package entity

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Status struct {
	Id        uuid.UUID  `gorm:"primaryKey"`
	Content   string     `gorm:"type:text"`
	AccountId uuid.UUID  `gorm:"index"`
	Account   *Account   `gorm:"foreignKey:AccountId"`
	ReplyId   *uuid.UUID `gorm:"index"`
	Reply     *Status    `gorm:"foreignKey:ReplyId"`
	ReblogId  *uuid.UUID `gorm:"index"`
	Reblog    *Status    `gorm:"foreignKey:ReblogId"`
	Reactions []*Reaction
	CreatedAt time.Time
	UpdatedAt time.Time
}

func (r *Status) BeforeCreate(tx *gorm.DB) (err error) {
	uuid, err := uuid.NewRandom()
	if err != nil {
		return err
	}
	r.Id = uuid
	return nil
}
