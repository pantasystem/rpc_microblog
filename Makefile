# ./protoを元に、goのコードを生成する
generate:
	export PATH="$PATH:$(go env GOPATH)/bin"
	protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/account.proto
	protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/account_relationship.proto
	protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/custom_emoji.proto
	protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/follow.proto
	protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/reaction.proto
	protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/statuses.proto
	protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/timeline.proto

fg:
	export PATH="$PATH:$HOME/.pub-cache/bin"
	protoc --dart_out=grpc:client/lib/generated ./proto/account.proto
	protoc --dart_out=grpc:client/lib/generated ./proto/account_relationship.proto
	protoc --dart_out=grpc:client/lib/generated ./proto/custom_emoji.proto
	protoc --dart_out=grpc:client/lib/generated ./proto/follow.proto
	protoc --dart_out=grpc:client/lib/generated ./proto/reaction.proto
	protoc --dart_out=grpc:client/lib/generated ./proto/statuses.proto
	protoc --dart_out=grpc:client/lib/generated ./proto/timeline.proto
	protoc --dart_out=grpc:client/lib/generated google/protobuf/timestamp.proto
	protoc --dart_out=grpc:client/lib/generated google/protobuf/empty.proto 
