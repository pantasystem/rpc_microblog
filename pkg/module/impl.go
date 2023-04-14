package module

import (
	"gorm.io/gorm"
	"systems.panta/rpc-microblog/pkg/dao"
	"systems.panta/rpc-microblog/pkg/repository"
)

type ModuleImpl struct {
	Db *gorm.DB
}

func (m ModuleImpl) RepositoryModule() repository.Module {
	return dao.NewModule(m.Db)
}
