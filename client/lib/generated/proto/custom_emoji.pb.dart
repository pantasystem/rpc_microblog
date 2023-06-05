///
//  Generated code. Do not modify.
//  source: proto/custom_emoji.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CustomEmoji extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CustomEmoji', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emojiUrl')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  CustomEmoji._() : super();
  factory CustomEmoji({
    $core.String? id,
    $core.String? type,
    $core.String? emojiUrl,
    $core.int? width,
    $core.int? height,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    if (emojiUrl != null) {
      _result.emojiUrl = emojiUrl;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    return _result;
  }
  factory CustomEmoji.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CustomEmoji.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CustomEmoji clone() => CustomEmoji()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CustomEmoji copyWith(void Function(CustomEmoji) updates) => super.copyWith((message) => updates(message as CustomEmoji)) as CustomEmoji; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CustomEmoji create() => CustomEmoji._();
  CustomEmoji createEmptyInstance() => create();
  static $pb.PbList<CustomEmoji> createRepeated() => $pb.PbList<CustomEmoji>();
  @$core.pragma('dart2js:noInline')
  static CustomEmoji getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CustomEmoji>(create);
  static CustomEmoji? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get emojiUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set emojiUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmojiUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmojiUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get width => $_getIZ(3);
  @$pb.TagNumber(4)
  set width($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWidth() => $_has(3);
  @$pb.TagNumber(4)
  void clearWidth() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get height => $_getIZ(4);
  @$pb.TagNumber(5)
  set height($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);
}

class CustomEmojis extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CustomEmojis', createEmptyInstance: create)
    ..pc<CustomEmoji>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emojis', $pb.PbFieldType.PM, subBuilder: CustomEmoji.create)
    ..hasRequiredFields = false
  ;

  CustomEmojis._() : super();
  factory CustomEmojis({
    $core.Iterable<CustomEmoji>? emojis,
  }) {
    final _result = create();
    if (emojis != null) {
      _result.emojis.addAll(emojis);
    }
    return _result;
  }
  factory CustomEmojis.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CustomEmojis.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CustomEmojis clone() => CustomEmojis()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CustomEmojis copyWith(void Function(CustomEmojis) updates) => super.copyWith((message) => updates(message as CustomEmojis)) as CustomEmojis; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CustomEmojis create() => CustomEmojis._();
  CustomEmojis createEmptyInstance() => create();
  static $pb.PbList<CustomEmojis> createRepeated() => $pb.PbList<CustomEmojis>();
  @$core.pragma('dart2js:noInline')
  static CustomEmojis getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CustomEmojis>(create);
  static CustomEmojis? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<CustomEmoji> get emojis => $_getList(0);
}

class CreateCustomEmojiRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateCustomEmojiRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filename')
    ..hasRequiredFields = false
  ;

  CreateCustomEmojiRequest._() : super();
  factory CreateCustomEmojiRequest({
    $core.String? name,
    $core.String? filename,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (filename != null) {
      _result.filename = filename;
    }
    return _result;
  }
  factory CreateCustomEmojiRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCustomEmojiRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCustomEmojiRequest clone() => CreateCustomEmojiRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCustomEmojiRequest copyWith(void Function(CreateCustomEmojiRequest) updates) => super.copyWith((message) => updates(message as CreateCustomEmojiRequest)) as CreateCustomEmojiRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateCustomEmojiRequest create() => CreateCustomEmojiRequest._();
  CreateCustomEmojiRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCustomEmojiRequest> createRepeated() => $pb.PbList<CreateCustomEmojiRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCustomEmojiRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCustomEmojiRequest>(create);
  static CreateCustomEmojiRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get filename => $_getSZ(1);
  @$pb.TagNumber(2)
  set filename($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFilename() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilename() => clearField(2);
}

