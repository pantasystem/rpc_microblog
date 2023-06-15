package dao

import (
	"gorm.io/gorm"
	"systems.panta/rpc-microblog/pkg/event"
	"systems.panta/rpc-microblog/pkg/repository"
)

type ModuleImpl struct {
	Db                 *gorm.DB
	StatusEventManager *event.StatusEventManager
}

func (m ModuleImpl) AccountRepository() repository.AccountRepository {
	return &AccountRepositoryImpl{
		Db: m.Db,
	}
}

func (m ModuleImpl) FollowRepository() repository.FollowRepository {
	return &FollowRepositoryImpl{
		Db: m.Db,
	}
}

func (m ModuleImpl) StatusRepository() repository.StatusRepository {
	return &StatusRepositoryImpl{
		Db:                 m.Db,
		StatusEventManager: m.StatusEventManager,
	}
}

func (m ModuleImpl) CustomEmojiRepository() repository.CustomEmojiRepository {
	return &CustomEmojiRepositoryImpl{
		Db: m.Db,
	}
}

func NewModule(db *gorm.DB, sem *event.StatusEventManager) repository.Module {
	m := ModuleImpl{
		Db:                 db,
		StatusEventManager: sem,
	}
	return m
}
