import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class TakePicture extends StatefulWidget {
  const TakePicture({super.key});

  @override
  TakePictureState createState() => TakePictureState();
}

class TakePictureState extends State<TakePicture> {
  final photos = <File>[];

  void openCamera() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraCamera(
                  onFile: (file) {
                    photos.add(file);
                    Navigator.pop(context);
                    setState(() {});
                  },
                )));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: photos.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width,
            child: kIsWeb
                ? Image.network(photos[index].path)
                : Image.file(
                    photos[index],
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCamera,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
