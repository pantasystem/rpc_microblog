///
//  Generated code. Do not modify.
//  source: proto/follow.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use followRequestDescriptor instead')
const FollowRequest$json = const {
  '1': 'FollowRequest',
  '2': const [
    const {'1': 'account_id', '3': 1, '4': 1, '5': 9, '10': 'accountId'},
  ],
};

/// Descriptor for `FollowRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List followRequestDescriptor = $convert.base64Decode('Cg1Gb2xsb3dSZXF1ZXN0Eh0KCmFjY291bnRfaWQYASABKAlSCWFjY291bnRJZA==');
@$core.Deprecated('Use unFollowRequestDescriptor instead')
const UnFollowRequest$json = const {
  '1': 'UnFollowRequest',
  '2': const [
    const {'1': 'account_id', '3': 1, '4': 1, '5': 9, '10': 'accountId'},
  ],
};

/// Descriptor for `UnFollowRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unFollowRequestDescriptor = $convert.base64Decode('Cg9VbkZvbGxvd1JlcXVlc3QSHQoKYWNjb3VudF9pZBgBIAEoCVIJYWNjb3VudElk');
@$core.Deprecated('Use followsResponseDescriptor instead')
const FollowsResponse$json = const {
  '1': 'FollowsResponse',
  '2': const [
    const {'1': 'follows', '3': 1, '4': 3, '5': 11, '6': '.Follow', '10': 'follows'},
  ],
};

/// Descriptor for `FollowsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List followsResponseDescriptor = $convert.base64Decode('Cg9Gb2xsb3dzUmVzcG9uc2USIQoHZm9sbG93cxgBIAMoCzIHLkZvbGxvd1IHZm9sbG93cw==');
@$core.Deprecated('Use getFollowsRequestDescriptor instead')
const GetFollowsRequest$json = const {
  '1': 'GetFollowsRequest',
  '2': const [
    const {'1': 'account_id', '3': 1, '4': 1, '5': 9, '10': 'accountId'},
  ],
};

/// Descriptor for `GetFollowsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFollowsRequestDescriptor = $convert.base64Decode('ChFHZXRGb2xsb3dzUmVxdWVzdBIdCgphY2NvdW50X2lkGAEgASgJUglhY2NvdW50SWQ=');
@$core.Deprecated('Use getFollowersRequestDescriptor instead')
const GetFollowersRequest$json = const {
  '1': 'GetFollowersRequest',
  '2': const [
    const {'1': 'account_id', '3': 1, '4': 1, '5': 9, '10': 'accountId'},
  ],
};

/// Descriptor for `GetFollowersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFollowersRequestDescriptor = $convert.base64Decode('ChNHZXRGb2xsb3dlcnNSZXF1ZXN0Eh0KCmFjY291bnRfaWQYASABKAlSCWFjY291bnRJZA==');
@$core.Deprecated('Use followDescriptor instead')
const Follow$json = const {
  '1': 'Follow',
  '2': const [
    const {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.Account', '10': 'account'},
    const {'1': 'targetAccount', '3': 2, '4': 1, '5': 11, '6': '.Account', '10': 'targetAccount'},
  ],
};

/// Descriptor for `Follow`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List followDescriptor = $convert.base64Decode('CgZGb2xsb3cSIgoHYWNjb3VudBgBIAEoCzIILkFjY291bnRSB2FjY291bnQSLgoNdGFyZ2V0QWNjb3VudBgCIAEoCzIILkFjY291bnRSDXRhcmdldEFjY291bnQ=');
