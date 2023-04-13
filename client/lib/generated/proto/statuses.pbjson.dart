///
//  Generated code. Do not modify.
//  source: proto/statuses.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use statusDescriptor instead')
const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'account_id', '3': 3, '4': 1, '5': 9, '10': 'accountId'},
    const {'1': 'account', '3': 4, '4': 1, '5': 11, '6': '.Account', '10': 'account'},
    const {'1': 'reply_to', '3': 5, '4': 1, '5': 11, '6': '.Status', '9': 0, '10': 'replyTo', '17': true},
    const {'1': 'reblog', '3': 6, '4': 1, '5': 11, '6': '.Status', '9': 1, '10': 'reblog', '17': true},
    const {'1': 'reaction_counts', '3': 7, '4': 3, '5': 11, '6': '.ReactionCount', '10': 'reactionCounts'},
    const {'1': 'timestamp', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
  ],
  '8': const [
    const {'1': '_reply_to'},
    const {'1': '_reblog'},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode('CgZTdGF0dXMSDgoCaWQYASABKAlSAmlkEhgKB2NvbnRlbnQYAiABKAlSB2NvbnRlbnQSHQoKYWNjb3VudF9pZBgDIAEoCVIJYWNjb3VudElkEiIKB2FjY291bnQYBCABKAsyCC5BY2NvdW50UgdhY2NvdW50EicKCHJlcGx5X3RvGAUgASgLMgcuU3RhdHVzSABSB3JlcGx5VG+IAQESJAoGcmVibG9nGAYgASgLMgcuU3RhdHVzSAFSBnJlYmxvZ4gBARI3Cg9yZWFjdGlvbl9jb3VudHMYByADKAsyDi5SZWFjdGlvbkNvdW50Ug5yZWFjdGlvbkNvdW50cxI4Cgl0aW1lc3RhbXAYCCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl0aW1lc3RhbXBCCwoJX3JlcGx5X3RvQgkKB19yZWJsb2c=');
@$core.Deprecated('Use reactionCountDescriptor instead')
const ReactionCount$json = const {
  '1': 'ReactionCount',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'account_ids', '3': 2, '4': 3, '5': 9, '10': 'accountIds'},
    const {'1': 'me', '3': 3, '4': 1, '5': 8, '10': 'me'},
    const {'1': 'emoji_url', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'emojiUrl', '17': true},
    const {'1': 'emoji_width', '3': 5, '4': 1, '5': 5, '9': 1, '10': 'emojiWidth', '17': true},
    const {'1': 'emoji_height', '3': 6, '4': 1, '5': 5, '9': 2, '10': 'emojiHeight', '17': true},
  ],
  '8': const [
    const {'1': '_emoji_url'},
    const {'1': '_emoji_width'},
    const {'1': '_emoji_height'},
  ],
};

/// Descriptor for `ReactionCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reactionCountDescriptor = $convert.base64Decode('Cg1SZWFjdGlvbkNvdW50EhIKBHR5cGUYASABKAlSBHR5cGUSHwoLYWNjb3VudF9pZHMYAiADKAlSCmFjY291bnRJZHMSDgoCbWUYAyABKAhSAm1lEiAKCWVtb2ppX3VybBgEIAEoCUgAUghlbW9qaVVybIgBARIkCgtlbW9qaV93aWR0aBgFIAEoBUgBUgplbW9qaVdpZHRoiAEBEiYKDGVtb2ppX2hlaWdodBgGIAEoBUgCUgtlbW9qaUhlaWdodIgBAUIMCgpfZW1vamlfdXJsQg4KDF9lbW9qaV93aWR0aEIPCg1fZW1vamlfaGVpZ2h0');
@$core.Deprecated('Use createStatusRequestDescriptor instead')
const CreateStatusRequest$json = const {
  '1': 'CreateStatusRequest',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'reply_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'replyId', '17': true},
    const {'1': 'reblog_id', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'reblogId', '17': true},
  ],
  '8': const [
    const {'1': '_reply_id'},
    const {'1': '_reblog_id'},
  ],
};

/// Descriptor for `CreateStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStatusRequestDescriptor = $convert.base64Decode('ChNDcmVhdGVTdGF0dXNSZXF1ZXN0EhgKB2NvbnRlbnQYASABKAlSB2NvbnRlbnQSHgoIcmVwbHlfaWQYAiABKAlIAFIHcmVwbHlJZIgBARIgCglyZWJsb2dfaWQYAyABKAlIAVIIcmVibG9nSWSIAQFCCwoJX3JlcGx5X2lkQgwKCl9yZWJsb2dfaWQ=');
@$core.Deprecated('Use getStatusRequestDescriptor instead')
const GetStatusRequest$json = const {
  '1': 'GetStatusRequest',
  '2': const [
    const {'1': 'status_id', '3': 1, '4': 1, '5': 9, '10': 'statusId'},
  ],
};

/// Descriptor for `GetStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStatusRequestDescriptor = $convert.base64Decode('ChBHZXRTdGF0dXNSZXF1ZXN0EhsKCXN0YXR1c19pZBgBIAEoCVIIc3RhdHVzSWQ=');
@$core.Deprecated('Use deleteStatusRequestDescriptor instead')
const DeleteStatusRequest$json = const {
  '1': 'DeleteStatusRequest',
  '2': const [
    const {'1': 'status_id', '3': 1, '4': 1, '5': 9, '10': 'statusId'},
  ],
};

/// Descriptor for `DeleteStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteStatusRequestDescriptor = $convert.base64Decode('ChNEZWxldGVTdGF0dXNSZXF1ZXN0EhsKCXN0YXR1c19pZBgBIAEoCVIIc3RhdHVzSWQ=');
