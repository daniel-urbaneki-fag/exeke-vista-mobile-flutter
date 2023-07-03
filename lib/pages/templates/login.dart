import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromRGBO(43, 55, 63, 1),
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
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(text: "LOGIN"),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Color.fromRGBO(255, 251, 214, 1),
                                filled: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(text: "SENHA"),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Color.fromRGBO(255, 251, 214, 1),
                                filled: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 20),
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
                        padding: EdgeInsets.only(),
                        child: Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(242, 106, 53, 1)),
                            child: const Text.rich(
                              TextSpan(text: "LOGAR"),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            onPressed: () {},
                          ),
                        )),
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
