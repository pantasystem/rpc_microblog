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
import 'statuses.pb.dart' as $2;
export 'timeline.pb.dart';

class TimelineServiceClient extends $grpc.Client {
  static final _$getTimeline =
      $grpc.ClientMethod<$3.TimelineRequest, $3.TimelineResponse>(
          '/TimelineService/GetTimeline',
          ($3.TimelineRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.TimelineResponse.fromBuffer(value));
  static final _$getAccountTimeline =
      $grpc.ClientMethod<$3.AccountTimelineRequest, $3.TimelineResponse>(
          '/TimelineService/GetAccountTimeline',
          ($3.AccountTimelineRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.TimelineResponse.fromBuffer(value));
  static final _$observeTimeline =
      $grpc.ClientMethod<$3.StreamTimelineRequest, $2.Status>(
          '/TimelineService/ObserveTimeline',
          ($3.StreamTimelineRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Status.fromBuffer(value));

  TimelineServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.TimelineResponse> getTimeline(
      $3.TimelineRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTimeline, request, options: options);
  }

  $grpc.ResponseFuture<$3.TimelineResponse> getAccountTimeline(
      $3.AccountTimelineRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccountTimeline, request, options: options);
  }

  $grpc.ResponseStream<$2.Status> observeTimeline(
      $3.StreamTimelineRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$observeTimeline, $async.Stream.fromIterable([request]),
        options: options);
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
    $addMethod(
        $grpc.ServiceMethod<$3.AccountTimelineRequest, $3.TimelineResponse>(
            'GetAccountTimeline',
            getAccountTimeline_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.AccountTimelineRequest.fromBuffer(value),
            ($3.TimelineResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.StreamTimelineRequest, $2.Status>(
        'ObserveTimeline',
        observeTimeline_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $3.StreamTimelineRequest.fromBuffer(value),
        ($2.Status value) => value.writeToBuffer()));
  }

  $async.Future<$3.TimelineResponse> getTimeline_Pre(
      $grpc.ServiceCall call, $async.Future<$3.TimelineRequest> request) async {
    return getTimeline(call, await request);
  }

  $async.Future<$3.TimelineResponse> getAccountTimeline_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.AccountTimelineRequest> request) async {
    return getAccountTimeline(call, await request);
  }

  $async.Stream<$2.Status> observeTimeline_Pre($grpc.ServiceCall call,
      $async.Future<$3.StreamTimelineRequest> request) async* {
    yield* observeTimeline(call, await request);
  }

  $async.Future<$3.TimelineResponse> getTimeline(
      $grpc.ServiceCall call, $3.TimelineRequest request);
  $async.Future<$3.TimelineResponse> getAccountTimeline(
      $grpc.ServiceCall call, $3.AccountTimelineRequest request);
  $async.Stream<$2.Status> observeTimeline(
      $grpc.ServiceCall call, $3.StreamTimelineRequest request);
}
