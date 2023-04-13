///
//  Generated code. Do not modify.
//  source: proto/custom_emoji.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use customEmojiDescriptor instead')
const CustomEmoji$json = const {
  '1': 'CustomEmoji',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'emoji_url', '3': 3, '4': 1, '5': 9, '10': 'emojiUrl'},
    const {'1': 'width', '3': 4, '4': 1, '5': 5, '10': 'width'},
    const {'1': 'height', '3': 5, '4': 1, '5': 5, '10': 'height'},
  ],
};

/// Descriptor for `CustomEmoji`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List customEmojiDescriptor = $convert.base64Decode('CgtDdXN0b21FbW9qaRIOCgJpZBgBIAEoCVICaWQSEgoEdHlwZRgCIAEoCVIEdHlwZRIbCgllbW9qaV91cmwYAyABKAlSCGVtb2ppVXJsEhQKBXdpZHRoGAQgASgFUgV3aWR0aBIWCgZoZWlnaHQYBSABKAVSBmhlaWdodA==');
@$core.Deprecated('Use customEmojisDescriptor instead')
const CustomEmojis$json = const {
  '1': 'CustomEmojis',
  '2': const [
    const {'1': 'emojis', '3': 1, '4': 3, '5': 11, '6': '.CustomEmoji', '10': 'emojis'},
  ],
};

/// Descriptor for `CustomEmojis`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List customEmojisDescriptor = $convert.base64Decode('CgxDdXN0b21FbW9qaXMSJAoGZW1vamlzGAEgAygLMgwuQ3VzdG9tRW1vamlSBmVtb2ppcw==');
