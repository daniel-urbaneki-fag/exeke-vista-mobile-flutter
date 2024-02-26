import 'package:exekevistaapp/components/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:exekevistaapp/pages/solicitacao.dart';
import 'package:exekevistaapp/pages/visualizar-solicitacoes.dart';
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
          backgroundColor: Color.fromRGBO(43, 55, 63, 1),
          body: Stack(
            children: [
              CustomNavBar(currentPage: "Home", isHome: "home"),
              SingleChildScrollView(
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CustomButton(
                            nameLabelButton: "Nova Solicitação",
                            navigationFunction: (context) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Solicitacao()),
                              );
                            },
                          ),
                          CustomButton(
                            nameLabelButton: "Solicitações",
                            navigationFunction: (context) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const VisualizarSolicitacoes()),
                              );
                            },
                          ),
                        ],
                      ))
                ]),
              ),
            ],
          )),
    );
  }
}
