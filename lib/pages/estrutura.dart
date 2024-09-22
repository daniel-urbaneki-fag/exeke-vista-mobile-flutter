import 'package:exekevistaapp/components/CustomButton.dart';
import 'package:exekevistaapp/components/CustomTextLabelInput.dart';
import 'package:flutter/material.dart';
import 'package:exekevistaapp/components/CustomNavBar.dart';
import 'package:exekevistaapp/pages/tirar-foto.dart';
import '../models/client.dart';

class Estrutura extends StatefulWidget {
  const Estrutura({Key? key, required this.nameEstruct, required this.cliente});

  final String nameEstruct;
  final Cliente cliente;

  @override
  EstruturaState createState() => EstruturaState();
}

class EstruturaState extends State<Estrutura> {
  late String _nameEstruct;
  late bool _isVisible = false;
  late bool _isVisibleTes = false;
  late bool _isVisibleTer = false;
  late bool _isVisibleCom = false;

  // Controladores para os inputs

  // Padrão para todos
  final TextEditingController _numeroModulos = TextEditingController();
  final TextEditingController _tipoTelha = TextEditingController();
  final TextEditingController _idadeAparente = TextEditingController();

  // Estrutura metalica
  // Informações tesouras
  final TextEditingController _vaoLivreTesMetalicaController =
      TextEditingController();
  final TextEditingController _altTesMetalicaController =
      TextEditingController();
  final TextEditingController _altPerfilTesMetalicaController =
      TextEditingController();
  final TextEditingController _largPerfilTesMetalicaController =
      TextEditingController();
  final TextEditingController _espessuraPerfilTesMetalicaController =
      TextEditingController();
  // Informaçoes terças
  final TextEditingController _disTerMetalicaController =
      TextEditingController();
  final TextEditingController _altTerMetalicaController =
      TextEditingController();
  final TextEditingController _largPerfilTerMetalicaController =
      TextEditingController();
  final TextEditingController _espessPerfTerMetalicaController =
      TextEditingController();
  final TextEditingController _perfEnrijecidoTerMetalicaController =
      TextEditingController();
  // Informações complementares
  final TextEditingController _disPilaresCompleMetalicaController =
      TextEditingController();
  final TextEditingController _contraAvantamentoCompleMetalicaController =
      TextEditingController();
  final TextEditingController _agulhamentoCompleMetalicaController =
      TextEditingController();

  // Estrutura Madeira

  // Informações tesouras
  final TextEditingController _vaoLivreTesMadeiraController =
      TextEditingController();
  final TextEditingController _tipoCorteTesMadeiraController =
      TextEditingController();
  final TextEditingController _altCorteTesMadeiraController =
      TextEditingController();
  final TextEditingController _largCorteTesMadeiraController =
      TextEditingController();
  final TextEditingController _diametroTroncoTesMadeiraController =
      TextEditingController();
  // Informaçoes terças
  final TextEditingController _disTerMadeiraController =
      TextEditingController();
  final TextEditingController _altCorteTerMadeiraController =
      TextEditingController();
  final TextEditingController _largCorteTerMadeiraController =
      TextEditingController();
  // Informações complementares
  final TextEditingController _disPilaresCompleMadeiraController =
      TextEditingController();
  final TextEditingController _formaChumbamentoCompleMadeiraController =
      TextEditingController();

  // Estrutura Concreto

  // Informações tesouras
  final TextEditingController _vaoLivreTesConcretoController =
      TextEditingController();
  final TextEditingController _tipoTravamentoTesConcretoController =
      TextEditingController();
  // Informaçoes terças
  final TextEditingController _disTerConcretoController =
      TextEditingController();
  final TextEditingController _tipoTerConcretoController =
      TextEditingController();
  // Informações complementares
  final TextEditingController _disPilaresCompleConcretoController =
      TextEditingController();
  final TextEditingController _contraAventamentoCompleConcretoController =
      TextEditingController();
  final TextEditingController _agulhamentoCompleConcretoController =
      TextEditingController();
  final TextEditingController _tiranteCentralCompleConcretoController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameEstruct = widget.nameEstruct;
  }

  Widget _buildInputsInformacoesIniciais() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
            child: Column(
              children: [
                Row(
                  children: <CustomTextLabelInput>[
                    CustomTextLabelInput(
                        controller: _numeroModulos,
                        nameLabel: "Números de módulos"),
                  ],
                ),
                Row(
                  children: <CustomTextLabelInput>[
                    CustomTextLabelInput(
                        controller: _idadeAparente,
                        nameLabel: "Idade aparente"),
                  ],
                ),
                Row(
                  children: <CustomTextLabelInput>[
                    CustomTextLabelInput(
                        controller: _tipoTelha, nameLabel: "Tipo de telha"),
                  ],
                ),
              ],
            ))
      ],
    );
  }

  Widget _buildInputsForWood() {
    return Column(
      children: [
        Column(
          children: [
            CustomButton(
              nameLabelButton: "Informações sobre tesouras",
              navigationFunction: (context) {
                setState(() {
                  _isVisibleTes = !_isVisibleTes;
                });
              },
            ),
            Visibility(
              visible: !_isVisibleTes,
              child: Column(
                children: [
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _vaoLivreTesMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Vão livre",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _tipoCorteTesMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Tipo de corte",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _altCorteTesMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Altura do corte",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _largCorteTesMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Largura do corte",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _diametroTroncoTesMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Diâmetro do tronco",
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
              },
            ),
            Visibility(
              visible: !_isVisibleTer,
              child: Column(
                children: [
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _disTerMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Distâncias das terças",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _altCorteTerMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Altura do corte",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _largCorteTerMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Largura do corte",
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
              },
            ),
            Visibility(
              visible: !_isVisibleCom,
              child: Column(
                children: [
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _disPilaresCompleMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Distâncias entre pilares",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _formaChumbamentoCompleMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Forma de chumbamento",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInputsForConcrete() {
    return Column(
      children: [
        Column(
          children: [
            CustomButton(
              nameLabelButton: "Informações sobre tesouras",
              navigationFunction: (context) {
                setState(() {
                  _isVisibleTes = !_isVisibleTes;
                });
              },
            ),
            Visibility(
              visible: !_isVisibleTes,
              child: Column(
                children: [
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _vaoLivreTesConcretoController, // Adicionei o controlador aqui
                        nameLabel: "Vão livre",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _tipoTravamentoTesConcretoController, // Adicionei o controlador aqui
                        nameLabel: "Tipo de travamento",
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
              },
            ),
            Visibility(
              visible: !_isVisibleTer,
              child: Column(
                children: [
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _disTerConcretoController, // Adicionei o controlador aqui
                        nameLabel: "Distâncias das terças",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _tipoTerConcretoController, // Adicionei o controlador aqui
                        nameLabel: "Tipo das terças",
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
              },
            ),
            Visibility(
              visible: !_isVisibleCom,
              child: Column(
                children: [
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _disPilaresCompleConcretoController, // Adicionei o controlador aqui
                        nameLabel: "Distâncias entre pilares",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _contraAventamentoCompleConcretoController, // Adicionei o controlador aqui
                        nameLabel: "Possui contraventamento",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _agulhamentoCompleConcretoController, // Adicionei o controlador aqui
                        nameLabel: "Possui agulhamento",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _tiranteCentralCompleConcretoController, // Adicionei o controlador aqui
                        nameLabel: "Possui tirante central",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInputsForMetal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            CustomButton(
              nameLabelButton: "Informações sobre tesouras",
              navigationFunction: (context) {
                setState(() {
                  _isVisibleTes = !_isVisibleTes;
                });
              },
            ),
            Visibility(
              visible: !_isVisibleTes,
              child: Column(
                children: [
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _vaoLivreTesMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Vão livre",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _altTesMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Altura da tesoura",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _altPerfilTesMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Altura do perfil",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _largPerfilTesMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Largura do perfil",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _espessuraPerfilTesMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Espessura do perfil",
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
              },
            ),
            Visibility(
              visible: !_isVisibleTer,
              child: Column(
                children: [
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _disTerMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Distâncias das terças",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _altTerMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Altura das terças",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _largPerfilTerMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Largura do perfil",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _espessPerfTerMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Espessura do perfil",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _perfEnrijecidoTerMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Perfil enrijecido",
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
              },
            ),
            Visibility(
              visible: !_isVisibleCom,
              child: Column(
                children: [
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _disPilaresCompleMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Distâncias entre pilares",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _contraAvantamentoCompleMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Contraventamento",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        controller:
                            _agulhamentoCompleMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Agulhamento",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
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
                  _buildInputsInformacoesIniciais(),
                  if (_nameEstruct == "Estrutura Madeira") ...[
                    _buildInputsForWood(),
                  ] else if (_nameEstruct == "Estrutura Concreto") ...[
                    _buildInputsForConcrete(),
                  ] else if (_nameEstruct == "Estrutura Metálica") ...[
                    _buildInputsForMetal(),
                  ],
                  CustomButton(
                    nameLabelButton: "Capturar Imagens",
                    color: const Color.fromRGBO(242, 106, 53, 1),
                    navigationFunction: (context) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TirarFoto()));
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
