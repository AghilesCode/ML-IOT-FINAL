//
//  Generated code. Do not modify.
//  source: file.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use messageBonjourDescriptor instead')
const MessageBonjour$json = {
  '1': 'MessageBonjour',
  '2': [
    {'1': 'nom', '3': 1, '4': 1, '5': 9, '10': 'nom'},
  ],
};

/// Descriptor for `MessageBonjour`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageBonjourDescriptor = $convert.base64Decode(
    'Cg5NZXNzYWdlQm9uam91chIQCgNub20YASABKAlSA25vbQ==');

@$core.Deprecated('Use reponseBonjourDescriptor instead')
const ReponseBonjour$json = {
  '1': 'ReponseBonjour',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ReponseBonjour`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reponseBonjourDescriptor = $convert.base64Decode(
    'Cg5SZXBvbnNlQm9uam91chIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use coordonneesDescriptor instead')
const Coordonnees$json = {
  '1': 'Coordonnees',
  '2': [
    {'1': 'x', '3': 1, '4': 1, '5': 2, '10': 'x'},
    {'1': 'y', '3': 2, '4': 1, '5': 2, '10': 'y'},
    {'1': 'z', '3': 3, '4': 1, '5': 2, '10': 'z'},
  ],
};

/// Descriptor for `Coordonnees`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List coordonneesDescriptor = $convert.base64Decode(
    'CgtDb29yZG9ubmVlcxIMCgF4GAEgASgCUgF4EgwKAXkYAiABKAJSAXkSDAoBehgDIAEoAlIBeg'
    '==');

@$core.Deprecated('Use reponseCoordonneesDescriptor instead')
const ReponseCoordonnees$json = {
  '1': 'ReponseCoordonnees',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ReponseCoordonnees`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reponseCoordonneesDescriptor = $convert.base64Decode(
    'ChJSZXBvbnNlQ29vcmRvbm5lZXMSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use imageChunkDescriptor instead')
const ImageChunk$json = {
  '1': 'ImageChunk',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `ImageChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageChunkDescriptor = $convert.base64Decode(
    'CgpJbWFnZUNodW5rEhIKBGRhdGEYASABKAxSBGRhdGE=');

@$core.Deprecated('Use fileRequestDescriptor instead')
const FileRequest$json = {
  '1': 'FileRequest',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '10': 'filename'},
  ],
};

/// Descriptor for `FileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileRequestDescriptor = $convert.base64Decode(
    'CgtGaWxlUmVxdWVzdBISCgRkYXRhGAEgASgMUgRkYXRhEhoKCGZpbGVuYW1lGAIgASgJUghmaW'
    'xlbmFtZQ==');

@$core.Deprecated('Use uploadStatusDescriptor instead')
const UploadStatus$json = {
  '1': 'UploadStatus',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UploadStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadStatusDescriptor = $convert.base64Decode(
    'CgxVcGxvYWRTdGF0dXMSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use audioChunkDescriptor instead')
const AudioChunk$json = {
  '1': 'AudioChunk',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `AudioChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List audioChunkDescriptor = $convert.base64Decode(
    'CgpBdWRpb0NodW5rEhIKBGRhdGEYASABKAxSBGRhdGE=');

