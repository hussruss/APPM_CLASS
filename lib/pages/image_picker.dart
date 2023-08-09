import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pink, Colors.purple],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: imageFile != null
                      ? Image.file(File(imageFile!.path))
                      : Container(
                          child: const Center(
                            child: Text('No Image!!'),
                          ),
                        ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      onPressed: () async {
                        final picker = ImagePicker();
                        imageFile = await picker.pickImage(
                            source: ImageSource.camera, imageQuality: 100);
                        setState(() {});
                      },
                      backgroundColor: Colors.black,
                      child: Icon(Icons.camera),
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        final picker = ImagePicker();
                        imageFile = await picker.pickImage(
                            source: ImageSource.gallery, imageQuality: 100);
                        setState(() {});
                      },
                      backgroundColor: Colors.black,
                      child: Icon(Icons.library_add),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
