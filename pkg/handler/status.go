package handler

import (
	"context"
	"fmt"

	"github.com/google/uuid"
	"systems.panta/rpc-microblog/pkg/entity"
	"systems.panta/rpc-microblog/pkg/handler/proto"
	"systems.panta/rpc-microblog/pkg/module"
)

type StatusService struct {
	Module module.Module
	proto.UnimplementedStatusServiceServer
}

func (r *StatusService) CreateStatus(ctx context.Context, req *proto.CreateStatusRequest) (*proto.Status, error) {
	strAcId := ctx.Value(AccountId).(string)
	aId, err := uuid.Parse(strAcId)
	if err != nil {
		return nil, err
	}

	var replyId *uuid.UUID
	var reblogId *uuid.UUID

	if req.ReplyId != nil {
		rId, err := uuid.Parse(*req.ReplyId)
		if err != nil {
			return nil, err
		}
		replyId = &rId
	}

	if req.ReblogId != nil {
		rId, err := uuid.Parse(*req.ReblogId)
		if err != nil {
			return nil, err
		}
		reblogId = &rId
	}

	s, err := r.Module.RepositoryModule().StatusRepository().Create(ctx, &entity.Status{
		AccountId: aId,
		Content:   req.Content,
		ReplyId:   replyId,
		ReblogId:  reblogId,
	})
	if err != nil {
		return nil, err
	}
	return ConvertToProtoModel(s, &aId), nil
}

func (r *StatusService) GetStatus(ctx context.Context, req *proto.GetStatusRequest) (*proto.Status, error) {
	sId, err := uuid.Parse(req.StatusId)
	if err != nil {
		return nil, err
	}
	s, err := r.Module.RepositoryModule().StatusRepository().FindById(ctx, sId)
	if err != nil {
		return nil, err
	}
	aId, ok := ctx.Value(AccountId).(string)
	var aUuid *uuid.UUID
	if ok {
		u, _ := uuid.Parse(aId)
		aUuid = &u
	}
	return ConvertToProtoModel(s, aUuid), nil
}

func (r *StatusService) DeleteStatus(ctx context.Context, req *proto.DeleteStatusRequest) (*proto.Status, error) {
	sId, err := uuid.Parse(req.StatusId)
	if err != nil {
		return nil, err
	}
	aId, ok := ctx.Value(AccountId).(string)
	if !ok {
		return nil, fmt.Errorf("invalid account id")
	}

	aUuid, err := uuid.Parse(aId)
	if err != nil {
		return nil, err
	}

	s, err := r.Module.RepositoryModule().StatusRepository().FindById(ctx, sId)
	if err != nil {
		return nil, err
	}

	if s.AccountId != aUuid {
		return nil, fmt.Errorf("invalid account")
	}

	err = r.Module.RepositoryModule().StatusRepository().Delete(ctx, s)
	if err != nil {
		return nil, err
	}
	return ConvertToProtoModel(s, &aUuid), nil
}

func ConvertToProtoModel(s *entity.Status, myId *uuid.UUID) *proto.Status {
	p := &proto.Status{
		Id:        s.Id.String(),
		Content:   s.Content,
		AccountId: s.AccountId.String(),
	}
	if s.Reply != nil {
		p.ReplyTo = ConvertToProtoModel(s.Reply, myId)
	}

	if s.Reblog != nil {
		p.Reblog = ConvertToProtoModel(s.Reblog, myId)
	}

	// ReactionsをReactionCounts配列に変換
	p.ReactionCounts = make([]*proto.ReactionCount, 0)

	// stringをkeyとしproto.ReactionCountをvalueとするmapを作成
	reactionCountMap := make(map[string]*proto.ReactionCount)

	if s.Account != nil {
		p.Account = &proto.Account{
			Id:        s.Account.Id.String(),
			AvatarUrl: *s.Account.AvatarUrl,
			Name:      s.Account.Name,
		}
	}

	for _, r := range s.Reactions {
		c := reactionCountMap[r.Type]
		if c == nil {
			c = &proto.ReactionCount{
				Type: r.Type,
			}
			reactionCountMap[r.Type] = c

		}
		if r.CustomEmoji != nil {
			c.EmojiUrl = &r.CustomEmoji.EmojiPath
			h := int32(r.CustomEmoji.Height)
			c.EmojiHeight = &h
			w := int32(r.CustomEmoji.Width)
			c.EmojiWidth = &w
		}

		c.AccountIds = append(c.AccountIds, r.AccountId.String())

		if myId != nil && r.AccountId == *myId {
			c.Me = true
		}
	}

	return p
}
