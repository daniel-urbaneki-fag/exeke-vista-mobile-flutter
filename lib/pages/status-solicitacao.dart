import 'package:flutter/material.dart';
import 'package:exekevistaapp/components/CustomButton.dart';
import 'package:exekevistaapp/components/CustomNavBar.dart';
import 'package:exekevistaapp/pages/relatorio-laudo.dart';
//import 'package:exekevistaapp/pages/home.dart';
import 'package:exekevistaapp/components/CustomTextLabelInput.dart';

class StatusSolicitacao extends StatefulWidget {
  const StatusSolicitacao({super.key});

  @override
  StatusSolicitacaoState createState() => StatusSolicitacaoState();
}

class StatusSolicitacaoState extends State<StatusSolicitacao> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(43, 55, 63, 1),
          appBar: const CustomNavBar(currentPage: " Status Solicitação"),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(text: "Dados do cliente"),
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <CustomTextLabelInput>[
                        // CustomTextLabelInput(nameLabel: "Nome do cliente"),
                      ],
                    ),
                    Row(
                      children: <CustomTextLabelInput>[
                        // CustomTextLabelInput(nameLabel: "Tipo de Estrutura"),
                      ],
                    ),
                    Row(
                      children: <CustomTextLabelInput>[
                        // CustomTextLabelInput(nameLabel: "Situação da Análise"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(196, 196, 196, 0.289),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            nameLabelButton: "Visualizar Status",
                            color: const Color.fromRGBO(242, 106, 53, 1),
                            navigationFunction: (context) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Relatorio(
                                        nameEstruct: "Status da Solicitação")),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ]),
          )),
    );
  }
}
