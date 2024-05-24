import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:exekevistaapp/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _usuario = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  void _enviarInformacoes() async {
    String inputTextUsuario = _usuario.text;
    String inputTextSenha = _senha.text;

    String apiUrl = 'http://192.168.0.90:8080/login';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'login': {'usuario': inputTextUsuario, 'senha': inputTextSenha}
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Dados enviados com sucesso! $data');
      } else {
        print('Erro ao enviar dados. Código de status: ${response.statusCode}');
        print('Message: ${response.body}');
      }
    } catch (error) {
      print('Erro ao enviar dados: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromRGBO(43, 55, 63, 1),
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(5),
            child: Image(
                image: AssetImage('src/images/icon-exeke.png'), height: 300),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              height: 400,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(196, 196, 196, 0.289),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text.rich(
                              TextSpan(text: "LOGIN"),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            TextField(
                              controller: _usuario,
                              decoration: const InputDecoration(
                                fillColor: Color.fromRGBO(255, 251, 214, 1),
                                filled: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text.rich(
                              TextSpan(text: "SENHA"),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            TextField(
                              controller: _senha,
                              obscureText: true,
                              decoration: const InputDecoration(
                                fillColor: Color.fromRGBO(255, 251, 214, 1),
                                filled: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0),
                            child: const Text.rich(
                              TextSpan(text: "Esqueceu senha?"),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            onPressed: () {},
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(242, 106, 53, 1)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                            );
                          },
                          child: const Text.rich(
                            TextSpan(text: "LOGAR"),
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(255, 255, 255, 1)),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
