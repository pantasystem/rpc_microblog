///
//  Generated code. Do not modify.
//  source: proto/account_relationship.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use accountRelationshipDescriptor instead')
const AccountRelationship$json = const {
  '1': 'AccountRelationship',
  '2': const [
    const {'1': 'account_id', '3': 1, '4': 1, '5': 9, '10': 'accountId'},
    const {'1': 'is_following', '3': 2, '4': 1, '5': 8, '10': 'isFollowing'},
  ],
};

/// Descriptor for `AccountRelationship`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountRelationshipDescriptor = $convert.base64Decode('ChNBY2NvdW50UmVsYXRpb25zaGlwEh0KCmFjY291bnRfaWQYASABKAlSCWFjY291bnRJZBIhCgxpc19mb2xsb3dpbmcYAiABKAhSC2lzRm9sbG93aW5n');
@$core.Deprecated('Use getAccountRelationshipRequestDescriptor instead')
const GetAccountRelationshipRequest$json = const {
  '1': 'GetAccountRelationshipRequest',
  '2': const [
    const {'1': 'target_account_ids', '3': 2, '4': 3, '5': 9, '10': 'targetAccountIds'},
  ],
};

/// Descriptor for `GetAccountRelationshipRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccountRelationshipRequestDescriptor = $convert.base64Decode('Ch1HZXRBY2NvdW50UmVsYXRpb25zaGlwUmVxdWVzdBIsChJ0YXJnZXRfYWNjb3VudF9pZHMYAiADKAlSEHRhcmdldEFjY291bnRJZHM=');
@$core.Deprecated('Use getAccountRelationshipResponseDescriptor instead')
const GetAccountRelationshipResponse$json = const {
  '1': 'GetAccountRelationshipResponse',
  '2': const [
    const {'1': 'account_relationships', '3': 1, '4': 3, '5': 11, '6': '.AccountRelationship', '10': 'accountRelationships'},
  ],
};

/// Descriptor for `GetAccountRelationshipResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccountRelationshipResponseDescriptor = $convert.base64Decode('Ch5HZXRBY2NvdW50UmVsYXRpb25zaGlwUmVzcG9uc2USSQoVYWNjb3VudF9yZWxhdGlvbnNoaXBzGAEgAygLMhQuQWNjb3VudFJlbGF0aW9uc2hpcFIUYWNjb3VudFJlbGF0aW9uc2hpcHM=');
