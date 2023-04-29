package handler

import (
	// "com.github/pantasystem/rpc-chat/pkg/impl"
	"context"
	"fmt"

	grpc_middleware "github.com/grpc-ecosystem/go-grpc-middleware"
	grpc_auth "github.com/grpc-ecosystem/go-grpc-middleware/auth"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	"systems.panta/rpc-microblog/pkg/handler/proto"
	"systems.panta/rpc-microblog/pkg/module"
)

type Key int

const (
	AccountId Key = iota
)

func Setup(m module.Module) *grpc.Server {
	s := grpc.NewServer(
		grpc.UnaryInterceptor(
			grpc_middleware.ChainUnaryServer(
				NewAuthInterceptor(m),
			),
		),
	)

	accountService := AccountService{
		Module: m,
	}
	followService := FollowService{
		Module: m,
	}

	customEmojiService := CustomEmojiService{
		Module: m,
	}

	statusService := StatusService{
		Module: m,
	}

	timelineService := TimelienService{
		Module: m,
	}

	arService := AccountRelationshipService{
		ARS: m.ServiceModule().AccountRelationshipService(),
	}
	// roomService := RoomService{
	// 	Core: core,
	// }
	// messageService := MessageService{
	// 	Core: core,
	// }
	proto.RegisterAccountServiceServer(s, &accountService)
	proto.RegisterFollowServiceServer(s, &followService)
	proto.RegisterCustomEmojiServiceServer(s, &customEmojiService)
	proto.RegisterStatusServiceServer(s, &statusService)
	proto.RegisterTimelineServiceServer(s, &timelineService)
	proto.RegisterAccountRelationshipServiceServer(s, &arService)
	// proto.RegisterRoomServiceServer(s, &roomService)
	// proto.RegisterMessageServiceServer(s, &messageService)

	reflection.Register(s)

	return s
}

func NewAuthInterceptor(c module.Module) func(ctx context.Context,
	req interface{},
	info *grpc.UnaryServerInfo,
	handler grpc.UnaryHandler,
) (interface{}, error) {
	return func(ctx context.Context,
		req interface{},
		info *grpc.UnaryServerInfo,
		handler grpc.UnaryHandler,
	) (interface{}, error) {
		fmt.Printf("info.FullMethod: %v\n", info.FullMethod)
		// 認証をスキップするパス
		if info.FullMethod == "/AccountService/CreateAccount" {
			return handler(ctx, req)
		} else {
			// 認証がOKならContextを返す
			userIdSetCtx, err := authorize(c, ctx)
			if err != nil {
				if info.FullMethod == "/AccountService/FindMe" {
					return handler(ctx, req)
				}
				return nil, err
			}
			return handler(userIdSetCtx, req)
		}
	}

}

func authorize(module module.Module, ctx context.Context) (context.Context, error) {
	// ヘッダーのトークンからユーザIDを取得
	token, err := grpc_auth.AuthFromMD(ctx, "Bearer")
	if err != nil {
		return nil, err
	}
	// jwtのトークンを検証してuserIdを取得（処理の記載は割愛）
	userId, err := module.RepositoryModule().AccountRepository().FindByToken(ctx, token)
	if err != nil {
		return nil, err
	}

	return context.WithValue(ctx, AccountId, userId.Id.String()), nil
}
