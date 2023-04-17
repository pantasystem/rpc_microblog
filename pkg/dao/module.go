package dao

import (
	"gorm.io/gorm"
	"systems.panta/rpc-microblog/pkg/repository"
)

type ModuleImpl struct {
	Db *gorm.DB
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
		Db: m.Db,
	}
}

func (m ModuleImpl) CustomEmojiRepository() repository.CustomEmojiRepository {
	return &CustomEmojiRepositoryImpl{
		Db: m.Db,
	}
}

func NewModule(db *gorm.DB) repository.Module {
	m := ModuleImpl{
		Db: db,
	}
	return m
}
