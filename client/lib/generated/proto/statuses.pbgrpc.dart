///
//  Generated code. Do not modify.
//  source: proto/statuses.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'statuses.pb.dart' as $2;
export 'statuses.pb.dart';

class StatusServiceClient extends $grpc.Client {
  static final _$createStatus =
      $grpc.ClientMethod<$2.CreateStatusRequest, $2.Status>(
          '/StatusService/CreateStatus',
          ($2.CreateStatusRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Status.fromBuffer(value));
  static final _$getStatus = $grpc.ClientMethod<$2.GetStatusRequest, $2.Status>(
      '/StatusService/GetStatus',
      ($2.GetStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Status.fromBuffer(value));
  static final _$deleteStatus =
      $grpc.ClientMethod<$2.DeleteStatusRequest, $2.Status>(
          '/StatusService/DeleteStatus',
          ($2.DeleteStatusRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Status.fromBuffer(value));

  StatusServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.Status> createStatus($2.CreateStatusRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createStatus, request, options: options);
  }

  $grpc.ResponseFuture<$2.Status> getStatus($2.GetStatusRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStatus, request, options: options);
  }

  $grpc.ResponseFuture<$2.Status> deleteStatus($2.DeleteStatusRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteStatus, request, options: options);
  }
}

abstract class StatusServiceBase extends $grpc.Service {
  $core.String get $name => 'StatusService';

  StatusServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.CreateStatusRequest, $2.Status>(
        'CreateStatus',
        createStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.CreateStatusRequest.fromBuffer(value),
        ($2.Status value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetStatusRequest, $2.Status>(
        'GetStatus',
        getStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetStatusRequest.fromBuffer(value),
        ($2.Status value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeleteStatusRequest, $2.Status>(
        'DeleteStatus',
        deleteStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.DeleteStatusRequest.fromBuffer(value),
        ($2.Status value) => value.writeToBuffer()));
  }

  $async.Future<$2.Status> createStatus_Pre($grpc.ServiceCall call,
      $async.Future<$2.CreateStatusRequest> request) async {
    return createStatus(call, await request);
  }

  $async.Future<$2.Status> getStatus_Pre($grpc.ServiceCall call,
      $async.Future<$2.GetStatusRequest> request) async {
    return getStatus(call, await request);
  }

  $async.Future<$2.Status> deleteStatus_Pre($grpc.ServiceCall call,
      $async.Future<$2.DeleteStatusRequest> request) async {
    return deleteStatus(call, await request);
  }

  $async.Future<$2.Status> createStatus(
      $grpc.ServiceCall call, $2.CreateStatusRequest request);
  $async.Future<$2.Status> getStatus(
      $grpc.ServiceCall call, $2.GetStatusRequest request);
  $async.Future<$2.Status> deleteStatus(
      $grpc.ServiceCall call, $2.DeleteStatusRequest request);
}
