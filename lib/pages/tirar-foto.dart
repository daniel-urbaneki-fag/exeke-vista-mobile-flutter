import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class TirarFoto extends StatefulWidget {
  const TirarFoto({Key? key, required this.objectSolicitacaoFinal});

  final dynamic objectSolicitacaoFinal;

  @override
  TirarFotoState createState() => TirarFotoState();
}

class TirarFotoState extends State<TirarFoto> {
  final photos = <File>[];
  late dynamic _objectSolicitacaoFinal;

  @override
  void initState() {
    super.initState();
    _objectSolicitacaoFinal = widget.objectSolicitacaoFinal;
    // Inicialize a lista de fotos em base64 se ainda não estiver presente
    _objectSolicitacaoFinal['imagens'] ??= [];
  }

  void openCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CameraCamera(
          onFile: (file) async {
            // Adiciona o arquivo à lista de fotos
            photos.add(file);

            // Converte a foto para base64
            final bytes = await file.readAsBytes();
            final base64Photo = base64Encode(bytes);

            // Adiciona a base64 ao objeto
            setState(() {
              _objectSolicitacaoFinal['imagens'].add(base64Photo);
            });

            Navigator.pop(context);

            print(_objectSolicitacaoFinal);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 55, 63, 1),
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
