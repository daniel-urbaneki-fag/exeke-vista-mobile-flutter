import 'package:flutter/material.dart';
import 'package:exekevistaapp/components/CustomButton.dart';
import 'package:exekevistaapp/components/CustomNavBar.dart';
import 'package:exekevistaapp/pages/estrutura.dart';
import 'package:exekevistaapp/components/TextLabelInput.dart';

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
        backgroundColor: Color.fromRGBO(43, 55, 63, 1),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomNavBar(currentPage: "Solicitacao"),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(text: "Dados do cliente"),
                    style: TextStyle(
                        fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
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
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(text: "Escolha a estrutura"),
                    style: TextStyle(
                        fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    nameLabelButton: "Estrutura Metálica",
                    color: Color.fromRGBO(242, 106, 53, 1),
                    navigationFunction: (context) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Estrutura()),
                      );
                    },
                  ),
                  CustomButton(
                    nameLabelButton: "Estrutura Madeira",
                    color: Color.fromRGBO(242, 106, 53, 1),
                    navigationFunction: (context) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Estrutura()),
                      );
                    },
                  ),
                  CustomButton(
                    nameLabelButton: "Estrutura Concreto",
                    color: Color.fromRGBO(242, 106, 53, 1),
                    navigationFunction: (context) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Estrutura()),
                      );
                    },
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
