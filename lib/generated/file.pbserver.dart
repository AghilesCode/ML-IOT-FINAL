//
//  Generated code. Do not modify.
//  source: file.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'file.pb.dart' as $0;
import 'file.pbjson.dart';

export 'file.pb.dart';

abstract class MonServiceBase extends $pb.GeneratedService {
  $async.Future<$0.ReponseBonjour> direBonjour($pb.ServerContext ctx, $0.MessageBonjour request);
  $async.Future<$0.ReponseCoordonnees> recupererCoordonnees($pb.ServerContext ctx, $0.Coordonnees request);
  $async.Future<$0.UploadStatus> uploadImage($pb.ServerContext ctx, $0.ImageChunk request);
  $async.Future<$0.UploadStatus> streamAudio($pb.ServerContext ctx, $0.AudioChunk request);
  $async.Future<$0.UploadStatus> uploadFile($pb.ServerContext ctx, $0.FileRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'DireBonjour': return $0.MessageBonjour();
      case 'RecupererCoordonnees': return $0.Coordonnees();
      case 'UploadImage': return $0.ImageChunk();
      case 'StreamAudio': return $0.AudioChunk();
      case 'UploadFile': return $0.FileRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'DireBonjour': return this.direBonjour(ctx, request as $0.MessageBonjour);
      case 'RecupererCoordonnees': return this.recupererCoordonnees(ctx, request as $0.Coordonnees);
      case 'UploadImage': return this.uploadImage(ctx, request as $0.ImageChunk);
      case 'StreamAudio': return this.streamAudio(ctx, request as $0.AudioChunk);
      case 'UploadFile': return this.uploadFile(ctx, request as $0.FileRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => MonServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => MonServiceBase$messageJson;
}

