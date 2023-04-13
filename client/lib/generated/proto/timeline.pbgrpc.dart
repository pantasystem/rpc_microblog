///
//  Generated code. Do not modify.
//  source: proto/timeline.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'timeline.pb.dart' as $3;
export 'timeline.pb.dart';

class TimelineServiceClient extends $grpc.Client {
  static final _$getTimeline =
      $grpc.ClientMethod<$3.TimelineRequest, $3.TimelineResponse>(
          '/TimelineService/GetTimeline',
          ($3.TimelineRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.TimelineResponse.fromBuffer(value));

  TimelineServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.TimelineResponse> getTimeline(
      $3.TimelineRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTimeline, request, options: options);
  }
}

abstract class TimelineServiceBase extends $grpc.Service {
  $core.String get $name => 'TimelineService';

  TimelineServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.TimelineRequest, $3.TimelineResponse>(
        'GetTimeline',
        getTimeline_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.TimelineRequest.fromBuffer(value),
        ($3.TimelineResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.TimelineResponse> getTimeline_Pre(
      $grpc.ServiceCall call, $async.Future<$3.TimelineRequest> request) async {
    return getTimeline(call, await request);
  }

  $async.Future<$3.TimelineResponse> getTimeline(
      $grpc.ServiceCall call, $3.TimelineRequest request);
}