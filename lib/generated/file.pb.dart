//
//  Generated code. Do not modify.
//  source: file.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MessageBonjour extends $pb.GeneratedMessage {
  factory MessageBonjour({
    $core.String? nom,
  }) {
    final $result = create();
    if (nom != null) {
      $result.nom = nom;
    }
    return $result;
  }
  MessageBonjour._() : super();
  factory MessageBonjour.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageBonjour.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MessageBonjour', package: const $pb.PackageName(_omitMessageNames ? '' : 'monprojetgrpc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nom')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageBonjour clone() => MessageBonjour()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageBonjour copyWith(void Function(MessageBonjour) updates) => super.copyWith((message) => updates(message as MessageBonjour)) as MessageBonjour;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageBonjour create() => MessageBonjour._();
  MessageBonjour createEmptyInstance() => create();
  static $pb.PbList<MessageBonjour> createRepeated() => $pb.PbList<MessageBonjour>();
  @$core.pragma('dart2js:noInline')
  static MessageBonjour getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageBonjour>(create);
  static MessageBonjour? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nom => $_getSZ(0);
  @$pb.TagNumber(1)
  set nom($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNom() => $_has(0);
  @$pb.TagNumber(1)
  void clearNom() => clearField(1);
}

class ReponseBonjour extends $pb.GeneratedMessage {
  factory ReponseBonjour({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  ReponseBonjour._() : super();
  factory ReponseBonjour.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReponseBonjour.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReponseBonjour', package: const $pb.PackageName(_omitMessageNames ? '' : 'monprojetgrpc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReponseBonjour clone() => ReponseBonjour()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReponseBonjour copyWith(void Function(ReponseBonjour) updates) => super.copyWith((message) => updates(message as ReponseBonjour)) as ReponseBonjour;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReponseBonjour create() => ReponseBonjour._();
  ReponseBonjour createEmptyInstance() => create();
  static $pb.PbList<ReponseBonjour> createRepeated() => $pb.PbList<ReponseBonjour>();
  @$core.pragma('dart2js:noInline')
  static ReponseBonjour getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReponseBonjour>(create);
  static ReponseBonjour? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class Coordonnees extends $pb.GeneratedMessage {
  factory Coordonnees({
    $core.double? x,
    $core.double? y,
    $core.double? z,
  }) {
    final $result = create();
    if (x != null) {
      $result.x = x;
    }
    if (y != null) {
      $result.y = y;
    }
    if (z != null) {
      $result.z = z;
    }
    return $result;
  }
  Coordonnees._() : super();
  factory Coordonnees.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Coordonnees.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Coordonnees', package: const $pb.PackageName(_omitMessageNames ? '' : 'monprojetgrpc'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'x', $pb.PbFieldType.OF)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'y', $pb.PbFieldType.OF)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'z', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Coordonnees clone() => Coordonnees()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Coordonnees copyWith(void Function(Coordonnees) updates) => super.copyWith((message) => updates(message as Coordonnees)) as Coordonnees;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Coordonnees create() => Coordonnees._();
  Coordonnees createEmptyInstance() => create();
  static $pb.PbList<Coordonnees> createRepeated() => $pb.PbList<Coordonnees>();
  @$core.pragma('dart2js:noInline')
  static Coordonnees getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Coordonnees>(create);
  static Coordonnees? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get z => $_getN(2);
  @$pb.TagNumber(3)
  set z($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasZ() => $_has(2);
  @$pb.TagNumber(3)
  void clearZ() => clearField(3);
}

class ReponseCoordonnees extends $pb.GeneratedMessage {
  factory ReponseCoordonnees({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  ReponseCoordonnees._() : super();
  factory ReponseCoordonnees.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReponseCoordonnees.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReponseCoordonnees', package: const $pb.PackageName(_omitMessageNames ? '' : 'monprojetgrpc'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReponseCoordonnees clone() => ReponseCoordonnees()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReponseCoordonnees copyWith(void Function(ReponseCoordonnees) updates) => super.copyWith((message) => updates(message as ReponseCoordonnees)) as ReponseCoordonnees;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReponseCoordonnees create() => ReponseCoordonnees._();
  ReponseCoordonnees createEmptyInstance() => create();
  static $pb.PbList<ReponseCoordonnees> createRepeated() => $pb.PbList<ReponseCoordonnees>();
  @$core.pragma('dart2js:noInline')
  static ReponseCoordonnees getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReponseCoordonnees>(create);
  static ReponseCoordonnees? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class ImageChunk extends $pb.GeneratedMessage {
  factory ImageChunk({
    $core.List<$core.int>? data,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  ImageChunk._() : super();
  factory ImageChunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageChunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageChunk', package: const $pb.PackageName(_omitMessageNames ? '' : 'monprojetgrpc'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageChunk clone() => ImageChunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageChunk copyWith(void Function(ImageChunk) updates) => super.copyWith((message) => updates(message as ImageChunk)) as ImageChunk;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageChunk create() => ImageChunk._();
  ImageChunk createEmptyInstance() => create();
  static $pb.PbList<ImageChunk> createRepeated() => $pb.PbList<ImageChunk>();
  @$core.pragma('dart2js:noInline')
  static ImageChunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageChunk>(create);
  static ImageChunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}

class FileRequest extends $pb.GeneratedMessage {
  factory FileRequest({
    $core.List<$core.int>? data,
    $core.String? filename,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    if (filename != null) {
      $result.filename = filename;
    }
    return $result;
  }
  FileRequest._() : super();
  factory FileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'monprojetgrpc'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'filename')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileRequest clone() => FileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileRequest copyWith(void Function(FileRequest) updates) => super.copyWith((message) => updates(message as FileRequest)) as FileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileRequest create() => FileRequest._();
  FileRequest createEmptyInstance() => create();
  static $pb.PbList<FileRequest> createRepeated() => $pb.PbList<FileRequest>();
  @$core.pragma('dart2js:noInline')
  static FileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileRequest>(create);
  static FileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get filename => $_getSZ(1);
  @$pb.TagNumber(2)
  set filename($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFilename() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilename() => clearField(2);
}

class UploadStatus extends $pb.GeneratedMessage {
  factory UploadStatus({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  UploadStatus._() : super();
  factory UploadStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadStatus', package: const $pb.PackageName(_omitMessageNames ? '' : 'monprojetgrpc'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadStatus clone() => UploadStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadStatus copyWith(void Function(UploadStatus) updates) => super.copyWith((message) => updates(message as UploadStatus)) as UploadStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadStatus create() => UploadStatus._();
  UploadStatus createEmptyInstance() => create();
  static $pb.PbList<UploadStatus> createRepeated() => $pb.PbList<UploadStatus>();
  @$core.pragma('dart2js:noInline')
  static UploadStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadStatus>(create);
  static UploadStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class AudioChunk extends $pb.GeneratedMessage {
  factory AudioChunk({
    $core.List<$core.int>? data,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  AudioChunk._() : super();
  factory AudioChunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AudioChunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AudioChunk', package: const $pb.PackageName(_omitMessageNames ? '' : 'monprojetgrpc'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AudioChunk clone() => AudioChunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AudioChunk copyWith(void Function(AudioChunk) updates) => super.copyWith((message) => updates(message as AudioChunk)) as AudioChunk;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AudioChunk create() => AudioChunk._();
  AudioChunk createEmptyInstance() => create();
  static $pb.PbList<AudioChunk> createRepeated() => $pb.PbList<AudioChunk>();
  @$core.pragma('dart2js:noInline')
  static AudioChunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AudioChunk>(create);
  static AudioChunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
