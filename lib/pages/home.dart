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
          currentPage: "MENU",
          isHome: "home",
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Container(
                        width: 300,
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 0.289),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: CustomButton(
                          nameLabelButton: "Nova Solicitação",
                          navigationFunction: (context) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Solicitacao(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: 300,
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 0.289),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: CustomButton(
                          nameLabelButton: "Editar Solicitação",
                          navigationFunction: (context) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VisualizarSolicitacoes(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30), // Espaço entre os botões
                      Container(
                        width: 300,
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 0.289),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: CustomButton(
                          nameLabelButton: "Status da Solicitação",
                          navigationFunction: (context) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StatusSolicitacao(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
