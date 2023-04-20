// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.26.0
// 	protoc        v3.21.12
// source: proto/follow.proto

package proto

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type FollowRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	AccountId string `protobuf:"bytes,1,opt,name=account_id,json=accountId,proto3" json:"account_id,omitempty"`
}

func (x *FollowRequest) Reset() {
	*x = FollowRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_follow_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *FollowRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*FollowRequest) ProtoMessage() {}

func (x *FollowRequest) ProtoReflect() protoreflect.Message {
	mi := &file_proto_follow_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use FollowRequest.ProtoReflect.Descriptor instead.
func (*FollowRequest) Descriptor() ([]byte, []int) {
	return file_proto_follow_proto_rawDescGZIP(), []int{0}
}

func (x *FollowRequest) GetAccountId() string {
	if x != nil {
		return x.AccountId
	}
	return ""
}

type UnFollowRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	AccountId string `protobuf:"bytes,1,opt,name=account_id,json=accountId,proto3" json:"account_id,omitempty"`
}

func (x *UnFollowRequest) Reset() {
	*x = UnFollowRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_follow_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UnFollowRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UnFollowRequest) ProtoMessage() {}

func (x *UnFollowRequest) ProtoReflect() protoreflect.Message {
	mi := &file_proto_follow_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UnFollowRequest.ProtoReflect.Descriptor instead.
func (*UnFollowRequest) Descriptor() ([]byte, []int) {
	return file_proto_follow_proto_rawDescGZIP(), []int{1}
}

func (x *UnFollowRequest) GetAccountId() string {
	if x != nil {
		return x.AccountId
	}
	return ""
}

var File_proto_follow_proto protoreflect.FileDescriptor

var file_proto_follow_proto_rawDesc = []byte{
	0x0a, 0x12, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2f, 0x66, 0x6f, 0x6c, 0x6c, 0x6f, 0x77, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x20, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2f, 0x61, 0x63, 0x63, 0x6f,
	0x75, 0x6e, 0x74, 0x5f, 0x72, 0x65, 0x6c, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x68, 0x69, 0x70,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x2e, 0x0a, 0x0d, 0x46, 0x6f, 0x6c, 0x6c, 0x6f, 0x77,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1d, 0x0a, 0x0a, 0x61, 0x63, 0x63, 0x6f, 0x75,
	0x6e, 0x74, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x61, 0x63, 0x63,
	0x6f, 0x75, 0x6e, 0x74, 0x49, 0x64, 0x22, 0x30, 0x0a, 0x0f, 0x55, 0x6e, 0x46, 0x6f, 0x6c, 0x6c,
	0x6f, 0x77, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1d, 0x0a, 0x0a, 0x61, 0x63, 0x63,
	0x6f, 0x75, 0x6e, 0x74, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x61,
	0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x49, 0x64, 0x32, 0x77, 0x0a, 0x0d, 0x46, 0x6f, 0x6c, 0x6c,
	0x6f, 0x77, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x30, 0x0a, 0x06, 0x46, 0x6f, 0x6c,
	0x6c, 0x6f, 0x77, 0x12, 0x0e, 0x2e, 0x46, 0x6f, 0x6c, 0x6c, 0x6f, 0x77, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x1a, 0x14, 0x2e, 0x41, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x52, 0x65, 0x6c,
	0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x68, 0x69, 0x70, 0x22, 0x00, 0x12, 0x34, 0x0a, 0x08, 0x55,
	0x6e, 0x46, 0x6f, 0x6c, 0x6c, 0x6f, 0x77, 0x12, 0x10, 0x2e, 0x55, 0x6e, 0x46, 0x6f, 0x6c, 0x6c,
	0x6f, 0x77, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x14, 0x2e, 0x41, 0x63, 0x63, 0x6f,
	0x75, 0x6e, 0x74, 0x52, 0x65, 0x6c, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x68, 0x69, 0x70, 0x22,
	0x00, 0x42, 0x13, 0x5a, 0x11, 0x70, 0x6b, 0x67, 0x2f, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65,
	0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_proto_follow_proto_rawDescOnce sync.Once
	file_proto_follow_proto_rawDescData = file_proto_follow_proto_rawDesc
)

func file_proto_follow_proto_rawDescGZIP() []byte {
	file_proto_follow_proto_rawDescOnce.Do(func() {
		file_proto_follow_proto_rawDescData = protoimpl.X.CompressGZIP(file_proto_follow_proto_rawDescData)
	})
	return file_proto_follow_proto_rawDescData
}

var file_proto_follow_proto_msgTypes = make([]protoimpl.MessageInfo, 2)
var file_proto_follow_proto_goTypes = []interface{}{
	(*FollowRequest)(nil),       // 0: FollowRequest
	(*UnFollowRequest)(nil),     // 1: UnFollowRequest
	(*AccountRelationship)(nil), // 2: AccountRelationship
}
var file_proto_follow_proto_depIdxs = []int32{
	0, // 0: FollowService.Follow:input_type -> FollowRequest
	1, // 1: FollowService.UnFollow:input_type -> UnFollowRequest
	2, // 2: FollowService.Follow:output_type -> AccountRelationship
	2, // 3: FollowService.UnFollow:output_type -> AccountRelationship
	2, // [2:4] is the sub-list for method output_type
	0, // [0:2] is the sub-list for method input_type
	0, // [0:0] is the sub-list for extension type_name
	0, // [0:0] is the sub-list for extension extendee
	0, // [0:0] is the sub-list for field type_name
}

func init() { file_proto_follow_proto_init() }
func file_proto_follow_proto_init() {
	if File_proto_follow_proto != nil {
		return
	}
	file_proto_account_relationship_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_proto_follow_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*FollowRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_proto_follow_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UnFollowRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_proto_follow_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   2,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_proto_follow_proto_goTypes,
		DependencyIndexes: file_proto_follow_proto_depIdxs,
		MessageInfos:      file_proto_follow_proto_msgTypes,
	}.Build()
	File_proto_follow_proto = out.File
	file_proto_follow_proto_rawDesc = nil
	file_proto_follow_proto_goTypes = nil
	file_proto_follow_proto_depIdxs = nil
}