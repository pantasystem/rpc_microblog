///
//  Generated code. Do not modify.
//  source: proto/follow.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'follow.pb.dart' as $1;
import 'account_relationship.pb.dart' as $0;
export 'follow.pb.dart';

class FollowServiceClient extends $grpc.Client {
  static final _$follow =
      $grpc.ClientMethod<$1.FollowRequest, $0.AccountRelationship>(
          '/FollowService/Follow',
          ($1.FollowRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AccountRelationship.fromBuffer(value));
  static final _$unFollow =
      $grpc.ClientMethod<$1.UnFollowRequest, $0.AccountRelationship>(
          '/FollowService/UnFollow',
          ($1.UnFollowRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AccountRelationship.fromBuffer(value));

  FollowServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.AccountRelationship> follow($1.FollowRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$follow, request, options: options);
  }

  $grpc.ResponseFuture<$0.AccountRelationship> unFollow(
      $1.UnFollowRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unFollow, request, options: options);
  }
}

abstract class FollowServiceBase extends $grpc.Service {
  $core.String get $name => 'FollowService';

  FollowServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.FollowRequest, $0.AccountRelationship>(
        'Follow',
        follow_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FollowRequest.fromBuffer(value),
        ($0.AccountRelationship value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UnFollowRequest, $0.AccountRelationship>(
        'UnFollow',
        unFollow_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UnFollowRequest.fromBuffer(value),
        ($0.AccountRelationship value) => value.writeToBuffer()));
  }

  $async.Future<$0.AccountRelationship> follow_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FollowRequest> request) async {
    return follow(call, await request);
  }

  $async.Future<$0.AccountRelationship> unFollow_Pre(
      $grpc.ServiceCall call, $async.Future<$1.UnFollowRequest> request) async {
    return unFollow(call, await request);
  }

  $async.Future<$0.AccountRelationship> follow(
      $grpc.ServiceCall call, $1.FollowRequest request);
  $async.Future<$0.AccountRelationship> unFollow(
      $grpc.ServiceCall call, $1.UnFollowRequest request);
}
