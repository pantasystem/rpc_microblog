package entity

import (
	"time"

	"github.com/google/uuid"
)

type Follow struct {
	Id        uuid.UUID `gorm:"primaryKey"`
	AccountId uuid.UUID `gorm:"index;uniqueIndex:idx_account_follow"`
	FollowId  uuid.UUID `gorm:"index;uniqueIndex:idx_account_follow"`
	CreatedAt time.Time
}
