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

func NewModule(db *gorm.DB) repository.Module {
	m := ModuleImpl{
		Db: db,
	}
	return m
}
