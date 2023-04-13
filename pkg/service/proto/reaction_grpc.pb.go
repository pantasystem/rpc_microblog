// Code generated by protoc-gen-go-grpc. DO NOT EDIT.

package proto

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// ReactionServiceClient is the client API for ReactionService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type ReactionServiceClient interface {
	CreateReaction(ctx context.Context, in *ReactionRequest, opts ...grpc.CallOption) (*Status, error)
	DeleteReaction(ctx context.Context, in *ReactionRequest, opts ...grpc.CallOption) (*Status, error)
}

type reactionServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewReactionServiceClient(cc grpc.ClientConnInterface) ReactionServiceClient {
	return &reactionServiceClient{cc}
}

func (c *reactionServiceClient) CreateReaction(ctx context.Context, in *ReactionRequest, opts ...grpc.CallOption) (*Status, error) {
	out := new(Status)
	err := c.cc.Invoke(ctx, "/ReactionService/CreateReaction", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *reactionServiceClient) DeleteReaction(ctx context.Context, in *ReactionRequest, opts ...grpc.CallOption) (*Status, error) {
	out := new(Status)
	err := c.cc.Invoke(ctx, "/ReactionService/DeleteReaction", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// ReactionServiceServer is the server API for ReactionService service.
// All implementations must embed UnimplementedReactionServiceServer
// for forward compatibility
type ReactionServiceServer interface {
	CreateReaction(context.Context, *ReactionRequest) (*Status, error)
	DeleteReaction(context.Context, *ReactionRequest) (*Status, error)
	mustEmbedUnimplementedReactionServiceServer()
}

// UnimplementedReactionServiceServer must be embedded to have forward compatible implementations.
type UnimplementedReactionServiceServer struct {
}

func (UnimplementedReactionServiceServer) CreateReaction(context.Context, *ReactionRequest) (*Status, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateReaction not implemented")
}
func (UnimplementedReactionServiceServer) DeleteReaction(context.Context, *ReactionRequest) (*Status, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteReaction not implemented")
}
func (UnimplementedReactionServiceServer) mustEmbedUnimplementedReactionServiceServer() {}

// UnsafeReactionServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to ReactionServiceServer will
// result in compilation errors.
type UnsafeReactionServiceServer interface {
	mustEmbedUnimplementedReactionServiceServer()
}

func RegisterReactionServiceServer(s grpc.ServiceRegistrar, srv ReactionServiceServer) {
	s.RegisterService(&ReactionService_ServiceDesc, srv)
}

func _ReactionService_CreateReaction_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ReactionRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ReactionServiceServer).CreateReaction(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/ReactionService/CreateReaction",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ReactionServiceServer).CreateReaction(ctx, req.(*ReactionRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _ReactionService_DeleteReaction_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ReactionRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ReactionServiceServer).DeleteReaction(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/ReactionService/DeleteReaction",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ReactionServiceServer).DeleteReaction(ctx, req.(*ReactionRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// ReactionService_ServiceDesc is the grpc.ServiceDesc for ReactionService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var ReactionService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "ReactionService",
	HandlerType: (*ReactionServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "CreateReaction",
			Handler:    _ReactionService_CreateReaction_Handler,
		},
		{
			MethodName: "DeleteReaction",
			Handler:    _ReactionService_DeleteReaction_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "proto/reaction.proto",
}
