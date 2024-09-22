import 'package:exekevistaapp/components/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:exekevistaapp/pages/solicitacao.dart';
import 'package:exekevistaapp/pages/visualizar-solicitacoes.dart';
import 'package:exekevistaapp/pages/status-solicitacao.dart';
import 'package:exekevistaapp/components/CustomNavBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(43, 55, 63, 1),
          appBar: const CustomNavBar(
            currentPage: "Home",
            isHome: "home",
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            CustomButton(
                              nameLabelButton: "Nova Solicitação",
                              navigationFunction: (context) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Solicitacao()),
                                );
                              },
                            ),
                            CustomButton(
                              nameLabelButton: "Editar Solicitação",
                              navigationFunction: (context) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VisualizarSolicitacoes()),
                                );
                              },
                            ),
                            CustomButton(
                              nameLabelButton: "Status da Solicitação",
                              navigationFunction: (context) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const StatusSolicitacao()),
                                );
                              },
                            ),
                          ],
                        ))),
              ),
            ],
          )),
    );
  }
}
