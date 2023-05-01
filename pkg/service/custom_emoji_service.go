package service

import (
	"context"
	"fmt"
	"image"
	"os"
	"path/filepath"

	"systems.panta/rpc-microblog/pkg/entity"
	"systems.panta/rpc-microblog/pkg/repository"
)

type CustomEmojiService struct {
	CR repository.CustomEmojiRepository
}

func (r *CustomEmojiService) Create(ctx context.Context, emojiName string, filename string) (*entity.CustomEmoji, error) {
	emojiPath := filepath.Join("uploads", filename)
	if _, err := os.Stat(emojiPath); os.IsNotExist(err) {
		fmt.Printf("file not found: %s\n", emojiPath)
		return nil, fmt.Errorf("file not found: %s", emojiPath)
	}

	customEmoji := entity.CustomEmoji{
		Name:      emojiName,
		EmojiPath: emojiPath,
	}

	file, err := os.Open(emojiPath)
	if err != nil {
		fmt.Printf("open file: %+v\n", err)
		return nil, fmt.Errorf("open file: %w", err)
	}
	defer file.Close()
	img, name, err := image.Decode(file)
	if err != nil {
		fmt.Printf("decode image:{%s}, path:{%s}: %s\n", name, emojiPath, err)
	} else {
		customEmoji.Width = img.Bounds().Dx()
		customEmoji.Height = img.Bounds().Dy()
	}

	return r.CR.Create(ctx, &customEmoji)
}
