import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class TirarFoto extends StatefulWidget {
  const TirarFoto({super.key});

  @override
  TirarFotoState createState() => TirarFotoState();
}

class TirarFotoState extends State<TirarFoto> {
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
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: photos.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
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
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
