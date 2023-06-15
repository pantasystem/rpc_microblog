package module

import (
	"gorm.io/gorm"
	"systems.panta/rpc-microblog/pkg/dao"
	"systems.panta/rpc-microblog/pkg/event"
	"systems.panta/rpc-microblog/pkg/repository"
	"systems.panta/rpc-microblog/pkg/service"
)

type ModuleImpl struct {
	Db                 *gorm.DB
	StatusEventManager *event.StatusEventManager
}

func (m ModuleImpl) RepositoryModule() repository.Module {
	return dao.NewModule(m.Db, m.StatusEventManager)
}

func (m ModuleImpl) ServiceModule() *service.Module {
	return &service.Module{
		RepositoryModule: m.RepositoryModule(),
	}
}

func (m ModuleImpl) EventModule() *event.Module {
	return event.NewEventModule(m.StatusEventManager)
}
