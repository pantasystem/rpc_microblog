package entity

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Follow struct {
	Id              uuid.UUID `gorm:"primaryKey"`
	AccountId       uuid.UUID `gorm:"index;uniqueIndex:idx_account_follow"`
	Account         Account   `gorm:"foreignKey:AccountId"`
	TargetAccountId uuid.UUID `gorm:"index;uniqueIndex:idx_account_follow"`
	TargetAccount   Account   `gorm:"foreignKey:TargetAccountId"`
	CreatedAt       time.Time
}

func (r *Follow) BeforeCreate(tx *gorm.DB) (err error) {
	uuid, err := uuid.NewRandom()
	if err != nil {
		return err
	}
	r.Id = uuid
	return nil
}
