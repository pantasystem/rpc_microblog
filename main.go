package main

import (
	"fmt"
	"net"
	"net/http"
	"os"
	"os/signal"
	"path/filepath"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"systems.panta/rpc-microblog/pkg/config"
	"systems.panta/rpc-microblog/pkg/entity"
	"systems.panta/rpc-microblog/pkg/handler"
	"systems.panta/rpc-microblog/pkg/module"
)

func main() {
	fmt.Printf("Start Server!!\n")
	err := godotenv.Load(".env")
	if err != nil {
		panic(err)
	}
	config := &config.Config{}
	config.LoadFromEnv()
	db, err := gorm.Open(postgres.Open(config.Dsn), &gorm.Config{})
	if err != nil {
		panic(err)
	}

	db.AutoMigrate(&entity.Account{}, &entity.Status{}, &entity.Reaction{}, &entity.CustomEmoji{}, &entity.Follow{})

	listener, err := net.Listen("tcp", fmt.Sprintf(":%d", config.Port))
	if err != nil {
		panic(err)
	}
	m := module.ModuleImpl{
		Db: db,
	}
	s := handler.Setup(m)
	go func() {
		fmt.Printf("start gRPC server port: %v", config.Port)
		s.Serve(listener)
	}()

	gr := gin.Default()
	go func() {
		gr.GET("/ping", func(c *gin.Context) {
			c.JSON(http.StatusOK, gin.H{
				"message": "pong",
			})
		})
		gr.POST("/uploads", func(c *gin.Context) {
			// フォームから送信された画像ファイルを取得
			file, err := c.FormFile("file")
			if err != nil {
				c.JSON(http.StatusBadRequest, gin.H{
					"error": "画像ファイルを選択してください",
				})
				return
			}

			// 保存するファイル名を生成
			ext := filepath.Ext(file.Filename)
			filename := fmt.Sprintf("%d%s", time.Now().Unix(), ext)

			// ローカルに保存するパスを生成
			savePath := filepath.Join("uploads", filename)

			// 画像ファイルをローカルに保存
			if err := c.SaveUploadedFile(file, savePath); err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{
					"error": "画像ファイルの保存に失敗しました",
				})
				return
			}

			c.JSON(http.StatusOK, gin.H{
				"file": filename,
			})
		})
		gr.Static("/uploads", "./uploads")
		gr.Run(fmt.Sprintf(":%d", 8081))
	}()

	quit := make(chan os.Signal, 1)
	signal.Notify(quit, os.Interrupt)
	<-quit
	fmt.Println("stopping gRPC server...")
	s.GracefulStop()
}
