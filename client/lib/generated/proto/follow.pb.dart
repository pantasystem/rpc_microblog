///
//  Generated code. Do not modify.
//  source: proto/follow.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'account.pb.dart' as $1;

class FollowRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FollowRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountId')
    ..hasRequiredFields = false
  ;

  FollowRequest._() : super();
  factory FollowRequest({
    $core.String? accountId,
  }) {
    final _result = create();
    if (accountId != null) {
      _result.accountId = accountId;
    }
    return _result;
  }
  factory FollowRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FollowRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FollowRequest clone() => FollowRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FollowRequest copyWith(void Function(FollowRequest) updates) => super.copyWith((message) => updates(message as FollowRequest)) as FollowRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FollowRequest create() => FollowRequest._();
  FollowRequest createEmptyInstance() => create();
  static $pb.PbList<FollowRequest> createRepeated() => $pb.PbList<FollowRequest>();
  @$core.pragma('dart2js:noInline')
  static FollowRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FollowRequest>(create);
  static FollowRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);
}

class UnFollowRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UnFollowRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountId')
    ..hasRequiredFields = false
  ;

  UnFollowRequest._() : super();
  factory UnFollowRequest({
    $core.String? accountId,
  }) {
    final _result = create();
    if (accountId != null) {
      _result.accountId = accountId;
    }
    return _result;
  }
  factory UnFollowRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnFollowRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnFollowRequest clone() => UnFollowRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnFollowRequest copyWith(void Function(UnFollowRequest) updates) => super.copyWith((message) => updates(message as UnFollowRequest)) as UnFollowRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnFollowRequest create() => UnFollowRequest._();
  UnFollowRequest createEmptyInstance() => create();
  static $pb.PbList<UnFollowRequest> createRepeated() => $pb.PbList<UnFollowRequest>();
  @$core.pragma('dart2js:noInline')
  static UnFollowRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnFollowRequest>(create);
  static UnFollowRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);
}

class FollowsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FollowsResponse', createEmptyInstance: create)
    ..pc<Follow>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'follows', $pb.PbFieldType.PM, subBuilder: Follow.create)
    ..hasRequiredFields = false
  ;

  FollowsResponse._() : super();
  factory FollowsResponse({
    $core.Iterable<Follow>? follows,
  }) {
    final _result = create();
    if (follows != null) {
      _result.follows.addAll(follows);
    }
    return _result;
  }
  factory FollowsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FollowsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FollowsResponse clone() => FollowsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FollowsResponse copyWith(void Function(FollowsResponse) updates) => super.copyWith((message) => updates(message as FollowsResponse)) as FollowsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FollowsResponse create() => FollowsResponse._();
  FollowsResponse createEmptyInstance() => create();
  static $pb.PbList<FollowsResponse> createRepeated() => $pb.PbList<FollowsResponse>();
  @$core.pragma('dart2js:noInline')
  static FollowsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FollowsResponse>(create);
  static FollowsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Follow> get follows => $_getList(0);
}

class GetFollowsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFollowsRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountId')
    ..hasRequiredFields = false
  ;

  GetFollowsRequest._() : super();
  factory GetFollowsRequest({
    $core.String? accountId,
  }) {
    final _result = create();
    if (accountId != null) {
      _result.accountId = accountId;
    }
    return _result;
  }
  factory GetFollowsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFollowsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFollowsRequest clone() => GetFollowsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFollowsRequest copyWith(void Function(GetFollowsRequest) updates) => super.copyWith((message) => updates(message as GetFollowsRequest)) as GetFollowsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFollowsRequest create() => GetFollowsRequest._();
  GetFollowsRequest createEmptyInstance() => create();
  static $pb.PbList<GetFollowsRequest> createRepeated() => $pb.PbList<GetFollowsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFollowsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFollowsRequest>(create);
  static GetFollowsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);
}

class GetFollowersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFollowersRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountId')
    ..hasRequiredFields = false
  ;

  GetFollowersRequest._() : super();
  factory GetFollowersRequest({
    $core.String? accountId,
  }) {
    final _result = create();
    if (accountId != null) {
      _result.accountId = accountId;
    }
    return _result;
  }
  factory GetFollowersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFollowersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFollowersRequest clone() => GetFollowersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFollowersRequest copyWith(void Function(GetFollowersRequest) updates) => super.copyWith((message) => updates(message as GetFollowersRequest)) as GetFollowersRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFollowersRequest create() => GetFollowersRequest._();
  GetFollowersRequest createEmptyInstance() => create();
  static $pb.PbList<GetFollowersRequest> createRepeated() => $pb.PbList<GetFollowersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFollowersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFollowersRequest>(create);
  static GetFollowersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);
}

class Follow extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Follow', createEmptyInstance: create)
    ..aOM<$1.Account>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'account', subBuilder: $1.Account.create)
    ..aOM<$1.Account>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetAccount', protoName: 'targetAccount', subBuilder: $1.Account.create)
    ..hasRequiredFields = false
  ;

  Follow._() : super();
  factory Follow({
    $1.Account? account,
    $1.Account? targetAccount,
  }) {
    final _result = create();
    if (account != null) {
      _result.account = account;
    }
    if (targetAccount != null) {
      _result.targetAccount = targetAccount;
    }
    return _result;
  }
  factory Follow.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Follow.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Follow clone() => Follow()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Follow copyWith(void Function(Follow) updates) => super.copyWith((message) => updates(message as Follow)) as Follow; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Follow create() => Follow._();
  Follow createEmptyInstance() => create();
  static $pb.PbList<Follow> createRepeated() => $pb.PbList<Follow>();
  @$core.pragma('dart2js:noInline')
  static Follow getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Follow>(create);
  static Follow? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Account get account => $_getN(0);
  @$pb.TagNumber(1)
  set account($1.Account v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);
  @$pb.TagNumber(1)
  $1.Account ensureAccount() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Account get targetAccount => $_getN(1);
  @$pb.TagNumber(2)
  set targetAccount($1.Account v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetAccount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetAccount() => clearField(2);
  @$pb.TagNumber(2)
  $1.Account ensureTargetAccount() => $_ensure(1);
}

