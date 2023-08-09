import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m1_s4/main.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.max);
    _controller.initialize().then((value) {
      setState(() {});
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CameraPreview(_controller),
        Positioned(
          bottom: 30,
          left: MediaQuery.of(context).size.width * 0.4,
          child: FloatingActionButton(
            onPressed: () async {
              final picture = await _controller.takePicture();
              print(picture);
              setState(() {});
            },
            backgroundColor: Colors.black,
            child: const Icon(Icons.camera),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 40,
          child: FloatingActionButton(
            onPressed: () async {
              double max = await _controller.getMaxZoomLevel();
              print(max);
              await _controller.setZoomLevel(max);

              setState(() {});
            },
            backgroundColor: Colors.black,
            child: const Icon(Icons.zoom_in),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 40,
          child: FloatingActionButton(
            onPressed: () async {
              double min = await _controller.getMinZoomLevel();
              await _controller.setZoomLevel(min);

              setState(() {});
            },
            backgroundColor: Colors.black,
            child: const Icon(Icons.zoom_out),
          ),
        )
      ],
    );
  }
}
