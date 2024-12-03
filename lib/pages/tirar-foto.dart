import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/api_routes.dart';
import 'package:http/http.dart' as http;

import 'package:exekevistaapp/pages/visualizar-solicitacoes.dart';

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

  Future<int?> getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences
        .getInt('userId'); // Retorna o ID do usuário armazenado
  }

  void saveSolicitacao() async {
    int? userId = await getUserId();
    if (userId != null) {
      _objectSolicitacaoFinal["solicitacao"] = {"id_usuario": userId};
      print('Solicitação salva com ID do usuário: $userId');
    } else {
      print('Erro: ID do usuário não encontrado no storage.');
    }

    String apiUrl = ApiRoutes.createSolicitacao;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(_objectSolicitacaoFinal),
      );

      if (response.statusCode == 200) {
        // final data = json.decode(response.body);
        // print('Dados enviados com sucesso! ${data}');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const VisualizarSolicitacoes()));
      } else {
        print('Erro ao enviar dados. Código de status: ${response.statusCode}');
        print('Message: ${response.body}');
      }
    } catch (error) {
      print('Erro ao enviar dados: $error');
    }

    // print(_objectSolicitacaoFinal);
  }

  void openCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CameraCamera(
          onFile: (file) async {
            photos.add(file);
            final bytes = await file.readAsBytes();
            final base64Photo = base64Encode(bytes);

            setState(() {
              _objectSolicitacaoFinal['imagens'].add(base64Photo);
            });

            Navigator.pop(context);
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
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
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
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 15, left: 10, right: 90, top: 0),
            child: ElevatedButton(
              onPressed: saveSolicitacao,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'Finalizar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCamera,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
