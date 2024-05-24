import 'package:exekevistaapp/components/CustomTextLabelInput.dart';
import 'package:flutter/material.dart';
import 'package:exekevistaapp/components/CustomNavBar.dart';

import '../components/CustomButton.dart';
import 'home.dart';
// import 'package:exekevistaapp/pages/tirar-foto.dart';

class VisualizarSolicitacoes extends StatefulWidget {
  const VisualizarSolicitacoes({super.key});

  @override
  VisualizarSolicitacoesState createState() => VisualizarSolicitacoesState();
}

class VisualizarSolicitacoesState extends State<VisualizarSolicitacoes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(43, 55, 63, 1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomNavBar(currentPage: "Editar Solicitação"),
              const Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: CustomTextLabelInput(nameLabel: "Pesquisar Cliente"),
                        ),
                        Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(242, 106, 53, 1),
                            ),
                            iconSize: 40.0,
                            onPressed: null,
                          ),
                        ),
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
                              fontSize: 20,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          Text.rich(
                            TextSpan(text: "01     Bionova     EM ANDAMENTO"),
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          Text.rich(
                            TextSpan(text: "02     Solar     CONCLUÍDO"),
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          Text.rich(
                            TextSpan(text: "03     Energise     EM ATRASO"),
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
              ),
              Center(
                child: CustomButton(
                  nameLabelButton: "Voltar",
                  color: const Color.fromRGBO(242, 106, 53, 1),
                  navigationFunction: (context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
