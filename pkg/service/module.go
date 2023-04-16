package service

import "systems.panta/rpc-microblog/pkg/repository"

type Module struct {
	RepositoryModule repository.Module
}

func (r *Module) FollowService() *FollowService {
	return &FollowService{
		FR: r.RepositoryModule.FollowRepository(),
	}
}

func (r *Module) AccountRelationshipService() *AccountRelationshipService {
	return &AccountRelationshipService{
		AR: r.RepositoryModule.AccountRepository(),
		FR: r.RepositoryModule.FollowRepository(),
	}
}
