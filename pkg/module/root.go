package module

import "systems.panta/rpc-microblog/pkg/repository"

type Module interface {
	RepositoryModule() repository.Module
}
