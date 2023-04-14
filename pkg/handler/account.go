package handler

import (
	"context"
	"errors"

	"github.com/google/uuid"
	emptypb "google.golang.org/protobuf/types/known/emptypb"
	"gorm.io/gorm"
	"systems.panta/rpc-microblog/pkg/entity"
	"systems.panta/rpc-microblog/pkg/handler/proto"
	"systems.panta/rpc-microblog/pkg/module"
)

type AccountService struct {
	Module module.Module
	proto.UnimplementedAccountServiceServer
}

func (r *AccountService) CreateAccount(ctx context.Context, req *proto.CreateAccountRequest) (*proto.CreateAccountResponse, error) {
	a := &entity.Account{
		AvatarUrl: &req.AvatarUrl,
		Name:      req.Name,
	}
	a, err := r.Module.RepositoryModule().AccountRepository().Create(ctx, a)

	if err != nil {
		return nil, err
	}

	return &proto.CreateAccountResponse{
		Token: a.Token.String(),
		Account: &proto.Account{
			Id:        a.Id.String(),
			Name:      a.Name,
			AvatarUrl: *a.AvatarUrl,
		},
	}, nil
}

func (r *AccountService) Find(ctx context.Context, req *proto.FindUser) (*proto.Account, error) {
	a, err := r.Module.RepositoryModule().AccountRepository().FindByID(ctx, uuid.MustParse(req.Id))
	if err != nil {
		return nil, err
	}
	return &proto.Account{
		Id:        a.Id.String(),
		Name:      a.Name,
		AvatarUrl: *a.AvatarUrl,
	}, nil
}

func (r *AccountService) FindMe(ctx context.Context, req *emptypb.Empty) (*proto.FindMeResponse, error) {
	aId, ok := ctx.Value(AccountId).(string)
	if !ok {
		return &proto.FindMeResponse{
			Account:   nil,
			AuthState: proto.AuthState_UNAUTHENTICATED,
		}, nil
	}
	accountId, err := uuid.Parse(aId)
	if err != nil {
		return nil, err
	}

	a, err := r.Module.RepositoryModule().AccountRepository().FindByID(ctx, accountId)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return &proto.FindMeResponse{
				Account:   nil,
				AuthState: proto.AuthState_UNAUTHENTICATED,
			}, nil
		}
		return nil, err
	}

	return &proto.FindMeResponse{
		Account: &proto.Account{
			Id:        a.Id.String(),
			Name:      a.Name,
			AvatarUrl: *a.AvatarUrl,
		},
		AuthState: proto.AuthState_AUTHENTICATED,
	}, nil
}
