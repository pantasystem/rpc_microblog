///
//  Generated code. Do not modify.
//  source: proto/timeline.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use timelineRequestDescriptor instead')
const TimelineRequest$json = const {
  '1': 'TimelineRequest',
  '2': const [
    const {'1': 'min_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'minId', '17': true},
    const {'1': 'max_id', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'maxId', '17': true},
  ],
  '8': const [
    const {'1': '_min_id'},
    const {'1': '_max_id'},
  ],
};

/// Descriptor for `TimelineRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timelineRequestDescriptor = $convert.base64Decode('Cg9UaW1lbGluZVJlcXVlc3QSGgoGbWluX2lkGAEgASgJSABSBW1pbklkiAEBEhoKBm1heF9pZBgCIAEoCUgBUgVtYXhJZIgBAUIJCgdfbWluX2lkQgkKB19tYXhfaWQ=');
@$core.Deprecated('Use timelineResponseDescriptor instead')
const TimelineResponse$json = const {
  '1': 'TimelineResponse',
  '2': const [
    const {'1': 'statuses', '3': 1, '4': 3, '5': 11, '6': '.Status', '10': 'statuses'},
    const {'1': 'next_min_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'nextMinId', '17': true},
    const {'1': 'next_max_id', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'nextMaxId', '17': true},
  ],
  '8': const [
    const {'1': '_next_min_id'},
    const {'1': '_next_max_id'},
  ],
};

/// Descriptor for `TimelineResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timelineResponseDescriptor = $convert.base64Decode('ChBUaW1lbGluZVJlc3BvbnNlEiMKCHN0YXR1c2VzGAEgAygLMgcuU3RhdHVzUghzdGF0dXNlcxIjCgtuZXh0X21pbl9pZBgCIAEoCUgAUgluZXh0TWluSWSIAQESIwoLbmV4dF9tYXhfaWQYAyABKAlIAVIJbmV4dE1heElkiAEBQg4KDF9uZXh0X21pbl9pZEIOCgxfbmV4dF9tYXhfaWQ=');
