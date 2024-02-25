import 'package:flutter/material.dart';
import 'package:exekevistaapp/components/CustomNavBar.dart';
// import 'package:exekevistaapp/pages/tirar-foto.dart';

class VisualizarSolicitacoes extends StatefulWidget {
  const VisualizarSolicitacoes({super.key});

  @override
  VisualizarSolicitacoesState createState() => VisualizarSolicitacoesState();
}

class VisualizarSolicitacoesState extends State<VisualizarSolicitacoes> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(43, 55, 63, 1),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomNavBar(currentPage: "Visualizar Solicitacoes"),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(text: "Visualizar Solicitacoes"),
                    style: TextStyle(
                        fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                  Padding(
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
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
