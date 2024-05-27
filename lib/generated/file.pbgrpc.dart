//
//  Generated code. Do not modify.
//  source: file.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'file.pb.dart' as $0;

export 'file.pb.dart';

@$pb.GrpcServiceName('monprojetgrpc.MonService')
class MonServiceClient extends $grpc.Client {
  static final _$direBonjour = $grpc.ClientMethod<$0.MessageBonjour, $0.ReponseBonjour>(
      '/monprojetgrpc.MonService/DireBonjour',
      ($0.MessageBonjour value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ReponseBonjour.fromBuffer(value));
  static final _$recupererCoordonnees = $grpc.ClientMethod<$0.Coordonnees, $0.ReponseCoordonnees>(
      '/monprojetgrpc.MonService/RecupererCoordonnees',
      ($0.Coordonnees value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ReponseCoordonnees.fromBuffer(value));
  static final _$uploadImage = $grpc.ClientMethod<$0.ImageChunk, $0.UploadStatus>(
      '/monprojetgrpc.MonService/UploadImage',
      ($0.ImageChunk value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UploadStatus.fromBuffer(value));
  static final _$streamAudio = $grpc.ClientMethod<$0.AudioChunk, $0.UploadStatus>(
      '/monprojetgrpc.MonService/StreamAudio',
      ($0.AudioChunk value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UploadStatus.fromBuffer(value));
  static final _$uploadFile = $grpc.ClientMethod<$0.FileRequest, $0.UploadStatus>(
      '/monprojetgrpc.MonService/UploadFile',
      ($0.FileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UploadStatus.fromBuffer(value));

  MonServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ReponseBonjour> direBonjour($0.MessageBonjour request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$direBonjour, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReponseCoordonnees> recupererCoordonnees($0.Coordonnees request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$recupererCoordonnees, request, options: options);
  }

  $grpc.ResponseFuture<$0.UploadStatus> uploadImage($async.Stream<$0.ImageChunk> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$uploadImage, request, options: options).single;
  }

  $grpc.ResponseFuture<$0.UploadStatus> streamAudio($async.Stream<$0.AudioChunk> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamAudio, request, options: options).single;
  }

  $grpc.ResponseFuture<$0.UploadStatus> uploadFile($0.FileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$uploadFile, request, options: options);
  }
}

@$pb.GrpcServiceName('monprojetgrpc.MonService')
abstract class MonServiceBase extends $grpc.Service {
  $core.String get $name => 'monprojetgrpc.MonService';

  MonServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.MessageBonjour, $0.ReponseBonjour>(
        'DireBonjour',
        direBonjour_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MessageBonjour.fromBuffer(value),
        ($0.ReponseBonjour value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Coordonnees, $0.ReponseCoordonnees>(
        'RecupererCoordonnees',
        recupererCoordonnees_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Coordonnees.fromBuffer(value),
        ($0.ReponseCoordonnees value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ImageChunk, $0.UploadStatus>(
        'UploadImage',
        uploadImage,
        true,
        false,
        ($core.List<$core.int> value) => $0.ImageChunk.fromBuffer(value),
        ($0.UploadStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AudioChunk, $0.UploadStatus>(
        'StreamAudio',
        streamAudio,
        true,
        false,
        ($core.List<$core.int> value) => $0.AudioChunk.fromBuffer(value),
        ($0.UploadStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FileRequest, $0.UploadStatus>(
        'UploadFile',
        uploadFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FileRequest.fromBuffer(value),
        ($0.UploadStatus value) => value.writeToBuffer()));
  }

  $async.Future<$0.ReponseBonjour> direBonjour_Pre($grpc.ServiceCall call, $async.Future<$0.MessageBonjour> request) async {
    return direBonjour(call, await request);
  }

  $async.Future<$0.ReponseCoordonnees> recupererCoordonnees_Pre($grpc.ServiceCall call, $async.Future<$0.Coordonnees> request) async {
    return recupererCoordonnees(call, await request);
  }

  $async.Future<$0.UploadStatus> uploadFile_Pre($grpc.ServiceCall call, $async.Future<$0.FileRequest> request) async {
    return uploadFile(call, await request);
  }

  $async.Future<$0.ReponseBonjour> direBonjour($grpc.ServiceCall call, $0.MessageBonjour request);
  $async.Future<$0.ReponseCoordonnees> recupererCoordonnees($grpc.ServiceCall call, $0.Coordonnees request);
  $async.Future<$0.UploadStatus> uploadImage($grpc.ServiceCall call, $async.Stream<$0.ImageChunk> request);
  $async.Future<$0.UploadStatus> streamAudio($grpc.ServiceCall call, $async.Stream<$0.AudioChunk> request);
  $async.Future<$0.UploadStatus> uploadFile($grpc.ServiceCall call, $0.FileRequest request);
}
