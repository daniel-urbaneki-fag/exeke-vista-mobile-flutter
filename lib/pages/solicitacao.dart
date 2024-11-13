import 'package:flutter/material.dart';
import 'package:exekevistaapp/components/CustomButton.dart';
import 'package:exekevistaapp/components/CustomNavBar.dart';
import 'package:exekevistaapp/pages/estrutura.dart';
import 'package:exekevistaapp/components/CustomTextLabelInput.dart';
import '../models/client.dart';

class Solicitacao extends StatefulWidget {
  const Solicitacao({super.key});

  @override
  SolicitacaoState createState() => SolicitacaoState();
}

class SolicitacaoState extends State<Solicitacao> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _numeroController = TextEditingController();
  final _bairroController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _estadoController = TextEditingController();
  final _cepController = TextEditingController();
  final _complementoController = TextEditingController();

  bool _saveData() {
    return !(_nomeController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _cpfController.text.isEmpty ||
        _telefoneController.text.isEmpty ||
        _enderecoController.text.isEmpty ||
        _numeroController.text.isEmpty ||
        _bairroController.text.isEmpty ||
        _cidadeController.text.isEmpty ||
        _estadoController.text.isEmpty ||
        _cepController.text.isEmpty);
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Atenção"),
          content:
              const Text("Por favor, preencha todos os campos obrigatórios."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _nextPage(String tipoEstrutura) {
    if (_saveData()) {
      // Crie o cliente aqui, após a validação
      Cliente cliente = Cliente(
        nome: _nomeController.text,
        email: _emailController.text,
        cpf: _cpfController.text,
        telefone: _telefoneController.text,
        endereco: _enderecoController.text,
        numero: _numeroController.text,
        bairro: _bairroController.text,
        cidade: _cidadeController.text,
        estado: _estadoController.text,
        cep: _cepController.text,
        complemento: _complementoController.text,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Estrutura(nameEstruct: tipoEstrutura, cliente: cliente),
        ),
      );
    } else {
      _showAlertDialog(); // Exibe o alerta se os dados não estiverem válidos
    }
  }

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
              child: Text(
                "Dados do cliente",
                style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomTextLabelInput(
                          valorPadrao: "João da silva",
                          nameLabel: "Nome do cliente",
                          controller: _nomeController),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTextLabelInput(
                          valorPadrao: "joao_silva@hotmail.com",
                          nameLabel: "Email",
                          controller: _emailController),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTextLabelInput(
                          valorPadrao: "10185376940",
                          nameLabel: "Cpf",
                          controller: _cpfController),
                      CustomTextLabelInput(
                          valorPadrao: "45999789334",
                          nameLabel: "Telefone",
                          controller: _telefoneController),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTextLabelInput(
                          valorPadrao: "Rua Teresina",
                          nameLabel: "Endereço",
                          controller: _enderecoController),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTextLabelInput(
                          valorPadrao: "398",
                          nameLabel: "Número",
                          controller: _numeroController),
                      CustomTextLabelInput(
                          valorPadrao: "Centro",
                          nameLabel: "Bairro",
                          controller: _bairroController),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTextLabelInput(
                          valorPadrao: "Cascavel",
                          nameLabel: "Cidade",
                          controller: _cidadeController),
                      CustomTextLabelInput(
                          valorPadrao: "PR",
                          nameLabel: "Estado",
                          controller: _estadoController),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTextLabelInput(
                          valorPadrao: "85836543",
                          nameLabel: "Cep",
                          controller: _cepController),
                      CustomTextLabelInput(
                          valorPadrao: "",
                          nameLabel: "Complemento",
                          controller: _complementoController),
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
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Escolha a estrutura",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          nameLabelButton: "Metálica",
                          color: const Color.fromRGBO(242, 106, 53, 1),
                          navigationFunction: (context) {
                            _nextPage("Estrutura Metálica");
                          },
                        ),
                        CustomButton(
                          nameLabelButton: "Madeira",
                          color: const Color.fromRGBO(242, 106, 53, 1),
                          navigationFunction: (context) {
                            _nextPage("Estrutura Madeira");
                          },
                        ),
                      ],
                    ),
                    CustomButton(
                      nameLabelButton: "Concreto",
                      color: const Color.fromRGBO(242, 106, 53, 1),
                      navigationFunction: (context) {
                        _nextPage("Estrutura Concreto");
                      },
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
