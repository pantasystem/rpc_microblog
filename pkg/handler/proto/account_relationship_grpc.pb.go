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

// AccountRelationshipServiceClient is the client API for AccountRelationshipService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type AccountRelationshipServiceClient interface {
	GetAccountRelationship(ctx context.Context, in *GetAccountRelationshipRequest, opts ...grpc.CallOption) (*GetAccountRelationshipResponse, error)
}

type accountRelationshipServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewAccountRelationshipServiceClient(cc grpc.ClientConnInterface) AccountRelationshipServiceClient {
	return &accountRelationshipServiceClient{cc}
}

func (c *accountRelationshipServiceClient) GetAccountRelationship(ctx context.Context, in *GetAccountRelationshipRequest, opts ...grpc.CallOption) (*GetAccountRelationshipResponse, error) {
	out := new(GetAccountRelationshipResponse)
	err := c.cc.Invoke(ctx, "/AccountRelationshipService/GetAccountRelationship", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// AccountRelationshipServiceServer is the server API for AccountRelationshipService service.
// All implementations must embed UnimplementedAccountRelationshipServiceServer
// for forward compatibility
type AccountRelationshipServiceServer interface {
	GetAccountRelationship(context.Context, *GetAccountRelationshipRequest) (*GetAccountRelationshipResponse, error)
	mustEmbedUnimplementedAccountRelationshipServiceServer()
}

// UnimplementedAccountRelationshipServiceServer must be embedded to have forward compatible implementations.
type UnimplementedAccountRelationshipServiceServer struct {
}

func (UnimplementedAccountRelationshipServiceServer) GetAccountRelationship(context.Context, *GetAccountRelationshipRequest) (*GetAccountRelationshipResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetAccountRelationship not implemented")
}
func (UnimplementedAccountRelationshipServiceServer) mustEmbedUnimplementedAccountRelationshipServiceServer() {
}

// UnsafeAccountRelationshipServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to AccountRelationshipServiceServer will
// result in compilation errors.
type UnsafeAccountRelationshipServiceServer interface {
	mustEmbedUnimplementedAccountRelationshipServiceServer()
}

func RegisterAccountRelationshipServiceServer(s grpc.ServiceRegistrar, srv AccountRelationshipServiceServer) {
	s.RegisterService(&AccountRelationshipService_ServiceDesc, srv)
}

func _AccountRelationshipService_GetAccountRelationship_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetAccountRelationshipRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AccountRelationshipServiceServer).GetAccountRelationship(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/AccountRelationshipService/GetAccountRelationship",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AccountRelationshipServiceServer).GetAccountRelationship(ctx, req.(*GetAccountRelationshipRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// AccountRelationshipService_ServiceDesc is the grpc.ServiceDesc for AccountRelationshipService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var AccountRelationshipService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "AccountRelationshipService",
	HandlerType: (*AccountRelationshipServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "GetAccountRelationship",
			Handler:    _AccountRelationshipService_GetAccountRelationship_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "proto/account_relationship.proto",
}
