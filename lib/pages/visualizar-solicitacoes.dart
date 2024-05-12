import 'package:exekevistaapp/components/CustomTextLabelInput.dart';
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
            CustomNavBar(currentPage: "Editar Solicitação"),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(text: ""),
                    style: TextStyle(
                        fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                  Row(
                    children: <Widget>[
                      CustomTextLabelInput(nameLabel: "Pesquisar Cliente"),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(text: "Id     Cliente     Status"),
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(255, 255, 255, 1),
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
