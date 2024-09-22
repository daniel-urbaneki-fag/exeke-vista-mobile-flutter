import 'package:exekevistaapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:exekevistaapp/pages/login.dart';
import '../config/api_routes.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<App> {
  @override
  void initState() {
    super.initState();
    verifyToken().then((value) {
      if (value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<bool> verifyToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // Verifica se o token existe
    String? token = sharedPreferences.getString('token');
    if (token != null) {
      String apiUrl =
          ApiRoutes.verifyToken; // URL do endpoint de verificação do token

      try {
        final response = await http.get(
          Uri.parse(apiUrl),
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer $token', // Envia o token no cabeçalho Authorization
          },
        );

        if (response.statusCode == 200) {
          print('Token válido');
          return true; // Token válido
        } else {
          print('Erro: Código de status: ${response.statusCode}');
          print('Resposta da API: ${response.body}');
          return false; // Token inválido ou outro erro
        }
      } catch (error) {
        print('Erro ao enviar dados: $error');
        return false; // Erro de conexão ou outro problema
      }
    } else {
      print('Token não encontrado');
      return false; // Nenhum token encontrado
    }
  }
}
