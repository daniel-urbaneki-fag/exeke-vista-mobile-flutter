import 'package:flutter/material.dart';
import 'package:exekevistaapp/components/CustomNavBar.dart';
import 'package:exekevistaapp/pages/tirar-foto.dart';

class Estrutura extends StatefulWidget {
  const Estrutura({Key? key, required this.nameEstruct});

  final String nameEstruct;

  @override
  EstruturaState createState() => EstruturaState();
}

class EstruturaState extends State<Estrutura> {
  late String _nameEstruct = "Teste";

  @override
  void initState() {
    super.initState();
    _nameEstruct = widget.nameEstruct;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(43, 55, 63, 1),
        appBar: CustomNavBar(currentPage: _nameEstruct),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text.rich(
                    TextSpan(text: "Dados da estrutura"),
                    style: TextStyle(
                        fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(text: "Número de módulos"),
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        TextField(
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            fillColor: Color.fromRGBO(255, 251, 214, 1),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(text: "Idade aparente"),
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        TextField(
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            fillColor: Color.fromRGBO(255, 251, 214, 1),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(196, 196, 196, 0.289),
                        elevation: 0),
                    child: const Text.rich(
                      TextSpan(text: "Tirar Foto"),
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TirarFoto()));
                    },
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
