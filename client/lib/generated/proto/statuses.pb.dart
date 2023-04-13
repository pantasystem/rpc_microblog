///
//  Generated code. Do not modify.
//  source: proto/statuses.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'account.pb.dart' as $0;
import '../google/protobuf/timestamp.pb.dart' as $3;

class Status extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Status', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountId')
    ..aOM<$0.Account>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'account', subBuilder: $0.Account.create)
    ..aOM<Status>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'replyTo', subBuilder: Status.create)
    ..aOM<Status>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reblog', subBuilder: Status.create)
    ..pc<ReactionCount>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reactionCounts', $pb.PbFieldType.PM, subBuilder: ReactionCount.create)
    ..aOM<$3.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp', subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Status._() : super();
  factory Status({
    $core.String? id,
    $core.String? content,
    $core.String? accountId,
    $0.Account? account,
    Status? replyTo,
    Status? reblog,
    $core.Iterable<ReactionCount>? reactionCounts,
    $3.Timestamp? timestamp,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (content != null) {
      _result.content = content;
    }
    if (accountId != null) {
      _result.accountId = accountId;
    }
    if (account != null) {
      _result.account = account;
    }
    if (replyTo != null) {
      _result.replyTo = replyTo;
    }
    if (reblog != null) {
      _result.reblog = reblog;
    }
    if (reactionCounts != null) {
      _result.reactionCounts.addAll(reactionCounts);
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    return _result;
  }
  factory Status.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Status.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Status clone() => Status()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Status copyWith(void Function(Status) updates) => super.copyWith((message) => updates(message as Status)) as Status; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Status create() => Status._();
  Status createEmptyInstance() => create();
  static $pb.PbList<Status> createRepeated() => $pb.PbList<Status>();
  @$core.pragma('dart2js:noInline')
  static Status getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Status>(create);
  static Status? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get accountId => $_getSZ(2);
  @$pb.TagNumber(3)
  set accountId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccountId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountId() => clearField(3);

  @$pb.TagNumber(4)
  $0.Account get account => $_getN(3);
  @$pb.TagNumber(4)
  set account($0.Account v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAccount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAccount() => clearField(4);
  @$pb.TagNumber(4)
  $0.Account ensureAccount() => $_ensure(3);

  @$pb.TagNumber(5)
  Status get replyTo => $_getN(4);
  @$pb.TagNumber(5)
  set replyTo(Status v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasReplyTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearReplyTo() => clearField(5);
  @$pb.TagNumber(5)
  Status ensureReplyTo() => $_ensure(4);

  @$pb.TagNumber(6)
  Status get reblog => $_getN(5);
  @$pb.TagNumber(6)
  set reblog(Status v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasReblog() => $_has(5);
  @$pb.TagNumber(6)
  void clearReblog() => clearField(6);
  @$pb.TagNumber(6)
  Status ensureReblog() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<ReactionCount> get reactionCounts => $_getList(6);

  @$pb.TagNumber(8)
  $3.Timestamp get timestamp => $_getN(7);
  @$pb.TagNumber(8)
  set timestamp($3.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasTimestamp() => $_has(7);
  @$pb.TagNumber(8)
  void clearTimestamp() => clearField(8);
  @$pb.TagNumber(8)
  $3.Timestamp ensureTimestamp() => $_ensure(7);
}

class ReactionCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReactionCount', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountIds')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'me')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emojiUrl')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emojiWidth', $pb.PbFieldType.O3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emojiHeight', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ReactionCount._() : super();
  factory ReactionCount({
    $core.String? type,
    $core.Iterable<$core.String>? accountIds,
    $core.bool? me,
    $core.String? emojiUrl,
    $core.int? emojiWidth,
    $core.int? emojiHeight,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (accountIds != null) {
      _result.accountIds.addAll(accountIds);
    }
    if (me != null) {
      _result.me = me;
    }
    if (emojiUrl != null) {
      _result.emojiUrl = emojiUrl;
    }
    if (emojiWidth != null) {
      _result.emojiWidth = emojiWidth;
    }
    if (emojiHeight != null) {
      _result.emojiHeight = emojiHeight;
    }
    return _result;
  }
  factory ReactionCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReactionCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReactionCount clone() => ReactionCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReactionCount copyWith(void Function(ReactionCount) updates) => super.copyWith((message) => updates(message as ReactionCount)) as ReactionCount; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReactionCount create() => ReactionCount._();
  ReactionCount createEmptyInstance() => create();
  static $pb.PbList<ReactionCount> createRepeated() => $pb.PbList<ReactionCount>();
  @$core.pragma('dart2js:noInline')
  static ReactionCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReactionCount>(create);
  static ReactionCount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get accountIds => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get me => $_getBF(2);
  @$pb.TagNumber(3)
  set me($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMe() => $_has(2);
  @$pb.TagNumber(3)
  void clearMe() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get emojiUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set emojiUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmojiUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmojiUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get emojiWidth => $_getIZ(4);
  @$pb.TagNumber(5)
  set emojiWidth($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmojiWidth() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmojiWidth() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get emojiHeight => $_getIZ(5);
  @$pb.TagNumber(6)
  set emojiHeight($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEmojiHeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearEmojiHeight() => clearField(6);
}

class CreateStatusRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateStatusRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'replyId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reblogId')
    ..hasRequiredFields = false
  ;

  CreateStatusRequest._() : super();
  factory CreateStatusRequest({
    $core.String? content,
    $core.String? replyId,
    $core.String? reblogId,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (replyId != null) {
      _result.replyId = replyId;
    }
    if (reblogId != null) {
      _result.reblogId = reblogId;
    }
    return _result;
  }
  factory CreateStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateStatusRequest clone() => CreateStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateStatusRequest copyWith(void Function(CreateStatusRequest) updates) => super.copyWith((message) => updates(message as CreateStatusRequest)) as CreateStatusRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateStatusRequest create() => CreateStatusRequest._();
  CreateStatusRequest createEmptyInstance() => create();
  static $pb.PbList<CreateStatusRequest> createRepeated() => $pb.PbList<CreateStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateStatusRequest>(create);
  static CreateStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get replyId => $_getSZ(1);
  @$pb.TagNumber(2)
  set replyId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReplyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReplyId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get reblogId => $_getSZ(2);
  @$pb.TagNumber(3)
  set reblogId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReblogId() => $_has(2);
  @$pb.TagNumber(3)
  void clearReblogId() => clearField(3);
}

class GetStatusRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetStatusRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusId')
    ..hasRequiredFields = false
  ;

  GetStatusRequest._() : super();
  factory GetStatusRequest({
    $core.String? statusId,
  }) {
    final _result = create();
    if (statusId != null) {
      _result.statusId = statusId;
    }
    return _result;
  }
  factory GetStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStatusRequest clone() => GetStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStatusRequest copyWith(void Function(GetStatusRequest) updates) => super.copyWith((message) => updates(message as GetStatusRequest)) as GetStatusRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetStatusRequest create() => GetStatusRequest._();
  GetStatusRequest createEmptyInstance() => create();
  static $pb.PbList<GetStatusRequest> createRepeated() => $pb.PbList<GetStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStatusRequest>(create);
  static GetStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get statusId => $_getSZ(0);
  @$pb.TagNumber(1)
  set statusId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusId() => clearField(1);
}

class DeleteStatusRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteStatusRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusId')
    ..hasRequiredFields = false
  ;

  DeleteStatusRequest._() : super();
  factory DeleteStatusRequest({
    $core.String? statusId,
  }) {
    final _result = create();
    if (statusId != null) {
      _result.statusId = statusId;
    }
    return _result;
  }
  factory DeleteStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteStatusRequest clone() => DeleteStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteStatusRequest copyWith(void Function(DeleteStatusRequest) updates) => super.copyWith((message) => updates(message as DeleteStatusRequest)) as DeleteStatusRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteStatusRequest create() => DeleteStatusRequest._();
  DeleteStatusRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteStatusRequest> createRepeated() => $pb.PbList<DeleteStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteStatusRequest>(create);
  static DeleteStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get statusId => $_getSZ(0);
  @$pb.TagNumber(1)
  set statusId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusId() => clearField(1);
}

