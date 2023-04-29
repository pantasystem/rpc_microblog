package handler

import (
	"context"
	"fmt"

	"github.com/google/uuid"
	"systems.panta/rpc-microblog/pkg/handler/proto"
	"systems.panta/rpc-microblog/pkg/service"
)

type AccountRelationshipService struct {
	ARS *service.AccountRelationshipService
	proto.UnimplementedAccountRelationshipServiceServer
}

func (r *AccountRelationshipService) GetAccountRelationship(ctx context.Context, in *proto.GetAccountRelationshipRequest) (*proto.GetAccountRelationshipResponse, error) {
	aId, ok := ctx.Value(AccountId).(string)
	if !ok {
		return nil, fmt.Errorf("invalid account id")
	}
	aUuid, err := uuid.Parse(aId)
	if err != nil {
		return nil, err
	}
	tIds := make([]uuid.UUID, len(in.TargetAccountIds))
	for i, tId := range in.TargetAccountIds {
		tIds[i], err = uuid.Parse(tId)
		if err != nil {
			return nil, err
		}
	}
	relationships := make([]*proto.AccountRelationship, len(tIds))
	for i, tId := range tIds {
		rel, err := r.ARS.FindBy(ctx, aUuid, tId)
		if err != nil {
			return nil, err
		}
		relationships[i] = &proto.AccountRelationship{
			AccountId:   tId.String(),
			IsFollowing: rel.IsFollowing,
		}

	}

	return &proto.GetAccountRelationshipResponse{
		AccountRelationships: relationships,
	}, nil
}
