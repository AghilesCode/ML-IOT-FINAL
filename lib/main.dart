import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:camera/camera.dart';


import 'generated/file.pbgrpc.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  CameraController? cameraController;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  static const Duration _ignoreDuration = Duration(milliseconds: 20);
  bool microphone = false;
  StreamSubscription? _microphoneSubscription;
  ClientChannel? clientChannel;
  MonServiceClient? client;
  final sendStream = StreamController<AudioChunk>();

  GyroscopeEvent? _gyroscopeEvent;
  DateTime? _gyroscopeUpdateTime;
  int? _gyroscopeLastInterval;
  Duration sensorInterval = SensorInterval.normalInterval;

  late Record _audioRecord;
  String? audioPath;

  Future<void> _initCamera() async {
    var cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    await cameraController!.initialize();
  }

  @override
  void initState() {
    super.initState();
    _audioRecord = Record();
    // Init channel for communications
    _initClient();
    // Gyroscope init of stream subscription
    _streamSubscriptions
        .add(gyroscopeEventStream(samplingPeriod: sensorInterval).listen(
      (GyroscopeEvent event) async {
        final now = DateTime.now();
        setState(() {
          _gyroscopeEvent = event;
          if (_gyroscopeUpdateTime != null) {
            final interval = now.difference(_gyroscopeUpdateTime!);
            if (interval > _ignoreDuration) {
              _gyroscopeLastInterval = interval.inMilliseconds;
            }
          }
        });

        if (_gyroscopeEvent != null) {
          if((_gyroscopeEvent!.x > -5 && _gyroscopeEvent!.x < -2.5) || (_gyroscopeEvent!.x > 2.5 && _gyroscopeEvent!.x < 5) ){
            await _sendCoordinates();
            await _uploadImage();
            _recordAudio();
            Future.delayed(const Duration(seconds: 5), (){
              _recordAudio();
            });
          }
        }
        _gyroscopeUpdateTime = now;
      },
      onError: (e) {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text("Sensor Not Found"),
                content: Text(
                    "It seems that your device doesn't support Gyroscope Sensor"),
              );
            });
      },
      cancelOnError: true,
    ));
    // Camera initialization
    _initCamera();
  }

  @override
  void dispose() {
    _audioRecord.dispose();
    super.dispose();
  }

  Future<void> _sendCoordinates() async {
    _initClient();
    try {
      var coordinates = Coordonnees(
          x: _gyroscopeEvent!.x, y: _gyroscopeEvent!.y, z: _gyroscopeEvent!.z);
      await client!.recupererCoordonnees(coordinates);
    } catch (e) {
      print('Caught error: $e');
    } finally {
      await clientChannel!.shutdown();
    }
  }

  Future<void> _uploadImage() async {
    _initClient();
    final stream = StreamController<ImageChunk>();
    try {
      final image = await cameraController!.takePicture();
      final bytes = await image.readAsBytes();
      final chunkSize = 1024;
      for (var i = 0; i < bytes.length; i += chunkSize) {
        final chunkEnd =
            (i + chunkSize < bytes.length) ? i + chunkSize : bytes.length;
        final chunk = bytes.sublist(i, chunkEnd);
        final imageChunk = ImageChunk()..data = chunk;
        stream.add(imageChunk);
      }
      stream.close();
      await client!.uploadImage(stream.stream);
    } catch (e) {
      print('Error uploading image: $e');
    } finally {
      await clientChannel!.shutdown();
    }
  }

  void _initClient() {
    clientChannel = ClientChannel(
      '10.192.88.230',
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    client = MonServiceClient(clientChannel!);
  }

  void _recordAudio() async {
    microphone = !microphone;
    if (microphone) {
      if(await _audioRecord.hasPermission()){
        final appDocDir = await getApplicationDocumentsDirectory();
        String _audioFilePath = '${appDocDir.path}/audio_temp.m4a'; // Set the temporary file path
        await _audioRecord.start(path: _audioFilePath);
      }
    } else {
        audioPath = await _audioRecord.stop();
        uploadFile(audioPath!);
    }
  }

  Future<File> getFile() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    String _audioFilePath = '${appDocDir.path}/audio_temp.m4a';
    return File(_audioFilePath);
  }

  Future<void> uploadFile(String filePath) async {
    try {
      final file = await getFile();
      final fileBytes = await file.readAsBytes();

      final request = FileRequest()
        ..data = fileBytes
        ..filename = "audio_temp.m4a";

      await client!.uploadFile(request);
    } catch (e) {
      print('Caught error: $e');
    } finally {
      // await clientChannel!.shutdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('My first App on Flutter'),
      ),
      body: Column(
        children: [
          // const Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8.0),
          //   child: Text('Gyroscope'),
          // ),
          Container(
            child: CameraPreview(cameraController!),
          ),
        ],
      ),
      floatingActionButton: Row(
        children: [
          Container(
              child: CupertinoButton.filled(
                  child: Icon(CupertinoIcons.camera),
                  onPressed: () => {
                        _uploadImage()
                      })),
          SizedBox(
            width: 10,
          ),
          Container(
            child: CupertinoButton.filled(
                child: const Icon(CupertinoIcons.mic_circle),
                onPressed: () {
                    _recordAudio();
                    Future.delayed(const Duration(seconds: 5), (){
                    _recordAudio();
                    });
                }),
          )
        ],
      ),
    ));
  }
}
