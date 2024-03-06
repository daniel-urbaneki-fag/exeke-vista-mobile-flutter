import 'package:flutter/material.dart';
import 'package:exekevistaapp/components/CustomButton.dart';
import 'package:exekevistaapp/components/CustomNavBar.dart';
import 'package:exekevistaapp/pages/estrutura.dart';
import 'package:exekevistaapp/components/CustomTextLabelInput.dart';

class Solicitacao extends StatefulWidget {
  const Solicitacao({super.key});

  @override
  SolicitacaoState createState() => SolicitacaoState();
}

class SolicitacaoState extends State<Solicitacao> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(43, 55, 63, 1),
          appBar: const CustomNavBar(currentPage: "Solicitação"),
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
                      children: [
                        TextLabelInput(nameLabel: "Nome do cliente"),
                      ],
                    ),
                    Row(
                      children: [
                        TextLabelInput(nameLabel: "Telefone"),
                        TextLabelInput(nameLabel: "Cep"),
                      ],
                    ),
                    Row(
                      children: [
                        TextLabelInput(nameLabel: "Endereço"),
                      ],
                    ),
                    Row(
                      children: [
                        TextLabelInput(nameLabel: "Número"),
                        TextLabelInput(nameLabel: "Complemento"),
                      ],
                    ),
                    Row(
                      children: [
                        TextLabelInput(nameLabel: "Bairro"),
                        TextLabelInput(nameLabel: "Cidade"),
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
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text.rich(
                              TextSpan(text: "Escolha a estrutura"),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            nameLabelButton: "Metálica",
                            color: const Color.fromRGBO(242, 106, 53, 1),
                            navigationFunction: (context) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Estrutura(
                                        nameEstruct: "Estrutura Metálica")),
                              );
                            },
                          ),
                          CustomButton(
                            nameLabelButton: "Madeira",
                            color: const Color.fromRGBO(242, 106, 53, 1),
                            navigationFunction: (context) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Estrutura(
                                        nameEstruct: "Estrutura Madeira")),
                              );
                            },
                          ),
                        ],
                      ),
                      CustomButton(
                        nameLabelButton: "Concreto",
                        color: const Color.fromRGBO(242, 106, 53, 1),
                        navigationFunction: (context) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Estrutura(
                                    nameEstruct: "Estrutura Concreto")),
                          );
                        },
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
