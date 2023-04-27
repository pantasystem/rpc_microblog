package main

import (
	"fmt"
	"net"
	"os"
	"os/signal"

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

	quit := make(chan os.Signal, 1)
	signal.Notify(quit, os.Interrupt)
	<-quit
	fmt.Println("stopping gRPC server...")
	s.GracefulStop()
}
