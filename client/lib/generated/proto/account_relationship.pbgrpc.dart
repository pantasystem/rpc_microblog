///
//  Generated code. Do not modify.
//  source: proto/account_relationship.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'account_relationship.pb.dart' as $0;
export 'account_relationship.pb.dart';

class AccountRelationshipServiceClient extends $grpc.Client {
  static final _$getAccountRelationship = $grpc.ClientMethod<
          $0.GetAccountRelationshipRequest, $0.GetAccountRelationshipResponse>(
      '/AccountRelationshipService/GetAccountRelationship',
      ($0.GetAccountRelationshipRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetAccountRelationshipResponse.fromBuffer(value));

  AccountRelationshipServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetAccountRelationshipResponse>
      getAccountRelationship($0.GetAccountRelationshipRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccountRelationship, request,
        options: options);
  }
}

abstract class AccountRelationshipServiceBase extends $grpc.Service {
  $core.String get $name => 'AccountRelationshipService';

  AccountRelationshipServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetAccountRelationshipRequest,
            $0.GetAccountRelationshipResponse>(
        'GetAccountRelationship',
        getAccountRelationship_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetAccountRelationshipRequest.fromBuffer(value),
        ($0.GetAccountRelationshipResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetAccountRelationshipResponse> getAccountRelationship_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetAccountRelationshipRequest> request) async {
    return getAccountRelationship(call, await request);
  }

  $async.Future<$0.GetAccountRelationshipResponse> getAccountRelationship(
      $grpc.ServiceCall call, $0.GetAccountRelationshipRequest request);
}
