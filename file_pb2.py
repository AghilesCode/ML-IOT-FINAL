# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: file.proto
# Protobuf Python Version: 4.25.0
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
from google.protobuf.internal import builder as _builder
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\nfile.proto\x12\rmonprojetgrpc\"\x1d\n\x0eMessageBonjour\x12\x0b\n\x03nom\x18\x01 \x01(\t\"!\n\x0eReponseBonjour\x12\x0f\n\x07message\x18\x01 \x01(\t\".\n\x0b\x43oordonnees\x12\t\n\x01x\x18\x01 \x01(\x02\x12\t\n\x01y\x18\x02 \x01(\x02\x12\t\n\x01z\x18\x03 \x01(\x02\"%\n\x12ReponseCoordonnees\x12\x0f\n\x07message\x18\x01 \x01(\t\"\x1a\n\nImageChunk\x12\x0c\n\x04\x64\x61ta\x18\x01 \x01(\x0c\"\x1f\n\x0cUploadStatus\x12\x0f\n\x07success\x18\x01 \x01(\x08\"\x1a\n\nAudioChunk\x12\x0c\n\x04\x64\x61ta\x18\x01 \x01(\x0c\x32\xc2\x02\n\nMonService\x12K\n\x0b\x44ireBonjour\x12\x1d.monprojetgrpc.MessageBonjour\x1a\x1d.monprojetgrpc.ReponseBonjour\x12U\n\x14RecupererCoordonnees\x12\x1a.monprojetgrpc.Coordonnees\x1a!.monprojetgrpc.ReponseCoordonnees\x12G\n\x0bUploadImage\x12\x19.monprojetgrpc.ImageChunk\x1a\x1b.monprojetgrpc.UploadStatus(\x01\x12G\n\x0bStreamAudio\x12\x19.monprojetgrpc.AudioChunk\x1a\x19.monprojetgrpc.AudioChunk(\x01\x30\x01\x62\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'file_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:
  DESCRIPTOR._options = None
  _globals['_MESSAGEBONJOUR']._serialized_start=29
  _globals['_MESSAGEBONJOUR']._serialized_end=58
  _globals['_REPONSEBONJOUR']._serialized_start=60
  _globals['_REPONSEBONJOUR']._serialized_end=93
  _globals['_COORDONNEES']._serialized_start=95
  _globals['_COORDONNEES']._serialized_end=141
  _globals['_REPONSECOORDONNEES']._serialized_start=143
  _globals['_REPONSECOORDONNEES']._serialized_end=180
  _globals['_IMAGECHUNK']._serialized_start=182
  _globals['_IMAGECHUNK']._serialized_end=208
  _globals['_UPLOADSTATUS']._serialized_start=210
  _globals['_UPLOADSTATUS']._serialized_end=241
  _globals['_AUDIOCHUNK']._serialized_start=243
  _globals['_AUDIOCHUNK']._serialized_end=269
  _globals['_MONSERVICE']._serialized_start=272
  _globals['_MONSERVICE']._serialized_end=594
# @@protoc_insertion_point(module_scope)
