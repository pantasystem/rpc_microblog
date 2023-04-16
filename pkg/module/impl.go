package module

import (
	"gorm.io/gorm"
	"systems.panta/rpc-microblog/pkg/dao"
	"systems.panta/rpc-microblog/pkg/repository"
	"systems.panta/rpc-microblog/pkg/service"
)

type ModuleImpl struct {
	Db *gorm.DB
}

func (m ModuleImpl) RepositoryModule() repository.Module {
	return dao.NewModule(m.Db)
}

func (m ModuleImpl) ServiceModule() *service.Module {
	return &service.Module{
		RepositoryModule: m.RepositoryModule(),
	}
}
