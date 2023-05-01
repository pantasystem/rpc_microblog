package handler

import (
	"context"

	"google.golang.org/protobuf/types/known/emptypb"
	"systems.panta/rpc-microblog/pkg/handler/proto"
	"systems.panta/rpc-microblog/pkg/module"
)

type CustomEmojiService struct {
	Module module.Module
	proto.UnimplementedCustomEmojiServiceServer
}

func (r *CustomEmojiService) GetCustomEmojis(ctx context.Context, req *emptypb.Empty) (*proto.CustomEmojis, error) {
	emojis, err := r.Module.RepositoryModule().CustomEmojiRepository().FindAll(ctx)
	if err != nil {
		return nil, err
	}

	// emojisをproto.CustomEmojisに変換する
	protoEmojis := &proto.CustomEmojis{}
	for _, emoji := range emojis {
		protoEmojis.Emojis = append(protoEmojis.Emojis, &proto.CustomEmoji{
			Id:       emoji.Id.String(),
			Type:     emoji.Type,
			EmojiUrl: emoji.EmojiPath,
			Width:    int32(emoji.Width),
			Height:   int32(emoji.Height),
		})
	}
	return protoEmojis, nil
}

func (r *CustomEmojiService) CreateCustomEmoji(ctx context.Context, req *proto.CreateCustomEmojiRequest) (*proto.CustomEmoji, error) {
	c, err := r.Module.ServiceModule().CustomEmojiService().Create(ctx, req.Name, req.Filename)
	if err != nil {
		return nil, err
	}
	return &proto.CustomEmoji{
		Id:       c.Id.String(),
		Type:     c.Type,
		EmojiUrl: c.EmojiPath,
		Width:    int32(c.Width),
		Height:   int32(c.Height),
	}, nil
}
