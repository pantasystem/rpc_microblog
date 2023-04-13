///
//  Generated code. Do not modify.
//  source: proto/reaction.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'reaction.pb.dart' as $3;
import 'statuses.pb.dart' as $2;
export 'reaction.pb.dart';

class ReactionServiceClient extends $grpc.Client {
  static final _$createReaction =
      $grpc.ClientMethod<$3.ReactionRequest, $2.Status>(
          '/ReactionService/CreateReaction',
          ($3.ReactionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Status.fromBuffer(value));
  static final _$deleteReaction =
      $grpc.ClientMethod<$3.ReactionRequest, $2.Status>(
          '/ReactionService/DeleteReaction',
          ($3.ReactionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Status.fromBuffer(value));

  ReactionServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.Status> createReaction($3.ReactionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createReaction, request, options: options);
  }

  $grpc.ResponseFuture<$2.Status> deleteReaction($3.ReactionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteReaction, request, options: options);
  }
}

abstract class ReactionServiceBase extends $grpc.Service {
  $core.String get $name => 'ReactionService';

  ReactionServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.ReactionRequest, $2.Status>(
        'CreateReaction',
        createReaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.ReactionRequest.fromBuffer(value),
        ($2.Status value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ReactionRequest, $2.Status>(
        'DeleteReaction',
        deleteReaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.ReactionRequest.fromBuffer(value),
        ($2.Status value) => value.writeToBuffer()));
  }

  $async.Future<$2.Status> createReaction_Pre(
      $grpc.ServiceCall call, $async.Future<$3.ReactionRequest> request) async {
    return createReaction(call, await request);
  }

  $async.Future<$2.Status> deleteReaction_Pre(
      $grpc.ServiceCall call, $async.Future<$3.ReactionRequest> request) async {
    return deleteReaction(call, await request);
  }

  $async.Future<$2.Status> createReaction(
      $grpc.ServiceCall call, $3.ReactionRequest request);
  $async.Future<$2.Status> deleteReaction(
      $grpc.ServiceCall call, $3.ReactionRequest request);
}
