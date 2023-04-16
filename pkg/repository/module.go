package repository

type Module interface {
	AccountRepository() AccountRepository
	FollowRepository() FollowRepository
}
