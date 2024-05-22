import 'package:exekevistaapp/components/CustomButton.dart';
import 'package:exekevistaapp/components/CustomTextLabelInput.dart';
import 'package:exekevistaapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:exekevistaapp/components/CustomNavBar.dart';
import 'package:exekevistaapp/pages/tirar-foto.dart';

class Estrutura extends StatefulWidget {
  const Estrutura({Key? key, required this.nameEstruct});

  final String nameEstruct;

  @override
  EstruturaState createState() => EstruturaState();
}

class EstruturaState extends State<Estrutura> {
  late String _nameEstruct;
  late bool _isVisible = false;
  late bool _isVisibleTes = false;
  late bool _isVisibleTer = false;
  late bool _isVisibleCom = false;

  @override
  void initState() {
    super.initState();
    _nameEstruct = widget.nameEstruct;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(43, 55, 63, 1),
        appBar: CustomNavBar(currentPage: _nameEstruct),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CustomButton(
                          nameLabelButton: "Informações Iniciais",
                          navigationFunction: (context) {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          }),
                      Visibility(
                          visible: !_isVisible,
                          child: const Column(
                            children: [
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Números de módulos"),
                                ],
                              ),
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Idade aparente"),
                                ],
                              ),
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Tipo de telha"),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      CustomButton(
                          nameLabelButton: "Informações sobre tesouras",
                          navigationFunction: (context) {
                            setState(() {
                              _isVisibleTes = !_isVisibleTes;
                            });
                          }),
                      Visibility(
                          visible: !_isVisibleTes,
                          child: const Column(
                            children: [
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(nameLabel: "Vão livre"),
                                ],
                              ),
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Altura da tesoura"),
                                ],
                              ),
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Altura do perfil"),
                                ],
                              ),
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Largura do perfil"),
                                ],
                              ),
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Espessura do perfil"),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      CustomButton(
                          nameLabelButton: "Informações sobre terças",
                          navigationFunction: (context) {
                            setState(() {
                              _isVisibleTer = !_isVisibleTer;
                            });
                          }),
                      Visibility(
                          visible: !_isVisibleTer,
                          child: const Column(
                            children: [
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Distâncias das terças"),
                                ],
                              ),
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Altura das terças"),
                                ],
                              ),
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Largura do perfil"),
                                ],
                              ),
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Espessura do perfil"),
                                ],
                              ),
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Perfil enrijecido"),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      CustomButton(
                          nameLabelButton: "Informações complementares",
                          navigationFunction: (context) {
                            setState(() {
                              _isVisibleCom = !_isVisibleCom;
                            });
                          }),
                      Visibility(
                          visible: !_isVisibleCom,
                          child: const Column(
                            children: [
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Distâncias entre pilares"),
                                ],
                              ),
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Contraventamento"),
                                ],
                              ),
                              Row(
                                children: <CustomTextLabelInput>[
                                  CustomTextLabelInput(
                                      nameLabel: "Agulhamento"),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                  CustomButton(
                    nameLabelButton: "Capturar Imagens",
                    color: const Color.fromRGBO(242, 106, 53, 1),
                    navigationFunction: (context) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TirarFoto()));
                    },
                  ),
                  CustomButton(
                    nameLabelButton: "Voltar",
                    color: const Color.fromRGBO(242, 106, 53, 1),
                    navigationFunction: (context) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
