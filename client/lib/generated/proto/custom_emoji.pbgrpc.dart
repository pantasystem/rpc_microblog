///
//  Generated code. Do not modify.
//  source: proto/custom_emoji.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import '../google/protobuf/empty.pb.dart' as $0;
import 'custom_emoji.pb.dart' as $1;
export 'custom_emoji.pb.dart';

class CustomEmojiServiceClient extends $grpc.Client {
  static final _$getCustomEmojis =
      $grpc.ClientMethod<$0.Empty, $1.CustomEmojis>(
          '/CustomEmojiService/GetCustomEmojis',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.CustomEmojis.fromBuffer(value));
  static final _$createCustomEmoji =
      $grpc.ClientMethod<$1.CreateCustomEmojiRequest, $1.CustomEmoji>(
          '/CustomEmojiService/CreateCustomEmoji',
          ($1.CreateCustomEmojiRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.CustomEmoji.fromBuffer(value));

  CustomEmojiServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.CustomEmojis> getCustomEmojis($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCustomEmojis, request, options: options);
  }

  $grpc.ResponseFuture<$1.CustomEmoji> createCustomEmoji(
      $1.CreateCustomEmojiRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createCustomEmoji, request, options: options);
  }
}

abstract class CustomEmojiServiceBase extends $grpc.Service {
  $core.String get $name => 'CustomEmojiService';

  CustomEmojiServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.CustomEmojis>(
        'GetCustomEmojis',
        getCustomEmojis_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.CustomEmojis value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CreateCustomEmojiRequest, $1.CustomEmoji>(
        'CreateCustomEmoji',
        createCustomEmoji_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.CreateCustomEmojiRequest.fromBuffer(value),
        ($1.CustomEmoji value) => value.writeToBuffer()));
  }

  $async.Future<$1.CustomEmojis> getCustomEmojis_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getCustomEmojis(call, await request);
  }

  $async.Future<$1.CustomEmoji> createCustomEmoji_Pre($grpc.ServiceCall call,
      $async.Future<$1.CreateCustomEmojiRequest> request) async {
    return createCustomEmoji(call, await request);
  }

  $async.Future<$1.CustomEmojis> getCustomEmojis(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.CustomEmoji> createCustomEmoji(
      $grpc.ServiceCall call, $1.CreateCustomEmojiRequest request);
}
