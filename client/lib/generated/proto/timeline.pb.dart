///
//  Generated code. Do not modify.
//  source: proto/timeline.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'statuses.pb.dart' as $2;

class TimelineRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TimelineRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxId')
    ..hasRequiredFields = false
  ;

  TimelineRequest._() : super();
  factory TimelineRequest({
    $core.String? minId,
    $core.String? maxId,
  }) {
    final _result = create();
    if (minId != null) {
      _result.minId = minId;
    }
    if (maxId != null) {
      _result.maxId = maxId;
    }
    return _result;
  }
  factory TimelineRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimelineRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimelineRequest clone() => TimelineRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimelineRequest copyWith(void Function(TimelineRequest) updates) => super.copyWith((message) => updates(message as TimelineRequest)) as TimelineRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TimelineRequest create() => TimelineRequest._();
  TimelineRequest createEmptyInstance() => create();
  static $pb.PbList<TimelineRequest> createRepeated() => $pb.PbList<TimelineRequest>();
  @$core.pragma('dart2js:noInline')
  static TimelineRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimelineRequest>(create);
  static TimelineRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get minId => $_getSZ(0);
  @$pb.TagNumber(1)
  set minId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMinId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get maxId => $_getSZ(1);
  @$pb.TagNumber(2)
  set maxId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxId() => clearField(2);
}

class TimelineResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TimelineResponse', createEmptyInstance: create)
    ..pc<$2.Status>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statuses', $pb.PbFieldType.PM, subBuilder: $2.Status.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextMinId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextMaxId')
    ..hasRequiredFields = false
  ;

  TimelineResponse._() : super();
  factory TimelineResponse({
    $core.Iterable<$2.Status>? statuses,
    $core.String? nextMinId,
    $core.String? nextMaxId,
  }) {
    final _result = create();
    if (statuses != null) {
      _result.statuses.addAll(statuses);
    }
    if (nextMinId != null) {
      _result.nextMinId = nextMinId;
    }
    if (nextMaxId != null) {
      _result.nextMaxId = nextMaxId;
    }
    return _result;
  }
  factory TimelineResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimelineResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimelineResponse clone() => TimelineResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimelineResponse copyWith(void Function(TimelineResponse) updates) => super.copyWith((message) => updates(message as TimelineResponse)) as TimelineResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TimelineResponse create() => TimelineResponse._();
  TimelineResponse createEmptyInstance() => create();
  static $pb.PbList<TimelineResponse> createRepeated() => $pb.PbList<TimelineResponse>();
  @$core.pragma('dart2js:noInline')
  static TimelineResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimelineResponse>(create);
  static TimelineResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.Status> get statuses => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextMinId => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextMinId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextMinId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextMinId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nextMaxId => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextMaxId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNextMaxId() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextMaxId() => clearField(3);
}

class AccountTimelineRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AccountTimelineRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxId')
    ..hasRequiredFields = false
  ;

  AccountTimelineRequest._() : super();
  factory AccountTimelineRequest({
    $core.String? accountId,
    $core.String? minId,
    $core.String? maxId,
  }) {
    final _result = create();
    if (accountId != null) {
      _result.accountId = accountId;
    }
    if (minId != null) {
      _result.minId = minId;
    }
    if (maxId != null) {
      _result.maxId = maxId;
    }
    return _result;
  }
  factory AccountTimelineRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountTimelineRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountTimelineRequest clone() => AccountTimelineRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountTimelineRequest copyWith(void Function(AccountTimelineRequest) updates) => super.copyWith((message) => updates(message as AccountTimelineRequest)) as AccountTimelineRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountTimelineRequest create() => AccountTimelineRequest._();
  AccountTimelineRequest createEmptyInstance() => create();
  static $pb.PbList<AccountTimelineRequest> createRepeated() => $pb.PbList<AccountTimelineRequest>();
  @$core.pragma('dart2js:noInline')
  static AccountTimelineRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountTimelineRequest>(create);
  static AccountTimelineRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get minId => $_getSZ(1);
  @$pb.TagNumber(2)
  set minId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get maxId => $_getSZ(2);
  @$pb.TagNumber(3)
  set maxId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaxId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxId() => clearField(3);
}

