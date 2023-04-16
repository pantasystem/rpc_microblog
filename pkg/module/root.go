package module

import (
	"systems.panta/rpc-microblog/pkg/repository"
	"systems.panta/rpc-microblog/pkg/service"
)

type Module interface {
	RepositoryModule() repository.Module
	ServiceModule() *service.Module
}
