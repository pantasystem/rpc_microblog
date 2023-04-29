///
//  Generated code. Do not modify.
//  source: proto/follow.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'follow.pb.dart' as $3;
import 'account_relationship.pb.dart' as $0;
export 'follow.pb.dart';

class FollowServiceClient extends $grpc.Client {
  static final _$follow =
      $grpc.ClientMethod<$3.FollowRequest, $0.AccountRelationship>(
          '/FollowService/Follow',
          ($3.FollowRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AccountRelationship.fromBuffer(value));
  static final _$unFollow =
      $grpc.ClientMethod<$3.UnFollowRequest, $0.AccountRelationship>(
          '/FollowService/UnFollow',
          ($3.UnFollowRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AccountRelationship.fromBuffer(value));
  static final _$getFollows =
      $grpc.ClientMethod<$3.GetFollowsRequest, $3.FollowsResponse>(
          '/FollowService/GetFollows',
          ($3.GetFollowsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.FollowsResponse.fromBuffer(value));
  static final _$getFollowers =
      $grpc.ClientMethod<$3.GetFollowersRequest, $3.FollowsResponse>(
          '/FollowService/GetFollowers',
          ($3.GetFollowersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.FollowsResponse.fromBuffer(value));

  FollowServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.AccountRelationship> follow($3.FollowRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$follow, request, options: options);
  }

  $grpc.ResponseFuture<$0.AccountRelationship> unFollow(
      $3.UnFollowRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unFollow, request, options: options);
  }

  $grpc.ResponseFuture<$3.FollowsResponse> getFollows(
      $3.GetFollowsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFollows, request, options: options);
  }

  $grpc.ResponseFuture<$3.FollowsResponse> getFollowers(
      $3.GetFollowersRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFollowers, request, options: options);
  }
}

abstract class FollowServiceBase extends $grpc.Service {
  $core.String get $name => 'FollowService';

  FollowServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.FollowRequest, $0.AccountRelationship>(
        'Follow',
        follow_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.FollowRequest.fromBuffer(value),
        ($0.AccountRelationship value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UnFollowRequest, $0.AccountRelationship>(
        'UnFollow',
        unFollow_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.UnFollowRequest.fromBuffer(value),
        ($0.AccountRelationship value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetFollowsRequest, $3.FollowsResponse>(
        'GetFollows',
        getFollows_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetFollowsRequest.fromBuffer(value),
        ($3.FollowsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetFollowersRequest, $3.FollowsResponse>(
        'GetFollowers',
        getFollowers_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.GetFollowersRequest.fromBuffer(value),
        ($3.FollowsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AccountRelationship> follow_Pre(
      $grpc.ServiceCall call, $async.Future<$3.FollowRequest> request) async {
    return follow(call, await request);
  }

  $async.Future<$0.AccountRelationship> unFollow_Pre(
      $grpc.ServiceCall call, $async.Future<$3.UnFollowRequest> request) async {
    return unFollow(call, await request);
  }

  $async.Future<$3.FollowsResponse> getFollows_Pre($grpc.ServiceCall call,
      $async.Future<$3.GetFollowsRequest> request) async {
    return getFollows(call, await request);
  }

  $async.Future<$3.FollowsResponse> getFollowers_Pre($grpc.ServiceCall call,
      $async.Future<$3.GetFollowersRequest> request) async {
    return getFollowers(call, await request);
  }

  $async.Future<$0.AccountRelationship> follow(
      $grpc.ServiceCall call, $3.FollowRequest request);
  $async.Future<$0.AccountRelationship> unFollow(
      $grpc.ServiceCall call, $3.UnFollowRequest request);
  $async.Future<$3.FollowsResponse> getFollows(
      $grpc.ServiceCall call, $3.GetFollowsRequest request);
  $async.Future<$3.FollowsResponse> getFollowers(
      $grpc.ServiceCall call, $3.GetFollowersRequest request);
}
