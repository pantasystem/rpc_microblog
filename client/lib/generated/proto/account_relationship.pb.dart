///
//  Generated code. Do not modify.
//  source: proto/account_relationship.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AccountRelationship extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AccountRelationship', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountId')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isFollowing')
    ..hasRequiredFields = false
  ;

  AccountRelationship._() : super();
  factory AccountRelationship({
    $core.String? accountId,
    $core.bool? isFollowing,
  }) {
    final _result = create();
    if (accountId != null) {
      _result.accountId = accountId;
    }
    if (isFollowing != null) {
      _result.isFollowing = isFollowing;
    }
    return _result;
  }
  factory AccountRelationship.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountRelationship.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountRelationship clone() => AccountRelationship()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountRelationship copyWith(void Function(AccountRelationship) updates) => super.copyWith((message) => updates(message as AccountRelationship)) as AccountRelationship; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountRelationship create() => AccountRelationship._();
  AccountRelationship createEmptyInstance() => create();
  static $pb.PbList<AccountRelationship> createRepeated() => $pb.PbList<AccountRelationship>();
  @$core.pragma('dart2js:noInline')
  static AccountRelationship getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountRelationship>(create);
  static AccountRelationship? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isFollowing => $_getBF(1);
  @$pb.TagNumber(2)
  set isFollowing($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsFollowing() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsFollowing() => clearField(2);
}

class GetAccountRelationshipRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetAccountRelationshipRequest', createEmptyInstance: create)
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetAccountIds')
    ..hasRequiredFields = false
  ;

  GetAccountRelationshipRequest._() : super();
  factory GetAccountRelationshipRequest({
    $core.Iterable<$core.String>? targetAccountIds,
  }) {
    final _result = create();
    if (targetAccountIds != null) {
      _result.targetAccountIds.addAll(targetAccountIds);
    }
    return _result;
  }
  factory GetAccountRelationshipRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountRelationshipRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAccountRelationshipRequest clone() => GetAccountRelationshipRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAccountRelationshipRequest copyWith(void Function(GetAccountRelationshipRequest) updates) => super.copyWith((message) => updates(message as GetAccountRelationshipRequest)) as GetAccountRelationshipRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAccountRelationshipRequest create() => GetAccountRelationshipRequest._();
  GetAccountRelationshipRequest createEmptyInstance() => create();
  static $pb.PbList<GetAccountRelationshipRequest> createRepeated() => $pb.PbList<GetAccountRelationshipRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAccountRelationshipRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountRelationshipRequest>(create);
  static GetAccountRelationshipRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.String> get targetAccountIds => $_getList(0);
}

class GetAccountRelationshipResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetAccountRelationshipResponse', createEmptyInstance: create)
    ..pc<AccountRelationship>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountRelationships', $pb.PbFieldType.PM, subBuilder: AccountRelationship.create)
    ..hasRequiredFields = false
  ;

  GetAccountRelationshipResponse._() : super();
  factory GetAccountRelationshipResponse({
    $core.Iterable<AccountRelationship>? accountRelationships,
  }) {
    final _result = create();
    if (accountRelationships != null) {
      _result.accountRelationships.addAll(accountRelationships);
    }
    return _result;
  }
  factory GetAccountRelationshipResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountRelationshipResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAccountRelationshipResponse clone() => GetAccountRelationshipResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAccountRelationshipResponse copyWith(void Function(GetAccountRelationshipResponse) updates) => super.copyWith((message) => updates(message as GetAccountRelationshipResponse)) as GetAccountRelationshipResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAccountRelationshipResponse create() => GetAccountRelationshipResponse._();
  GetAccountRelationshipResponse createEmptyInstance() => create();
  static $pb.PbList<GetAccountRelationshipResponse> createRepeated() => $pb.PbList<GetAccountRelationshipResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAccountRelationshipResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountRelationshipResponse>(create);
  static GetAccountRelationshipResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AccountRelationship> get accountRelationships => $_getList(0);
}

