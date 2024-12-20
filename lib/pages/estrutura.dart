import 'package:exekevistaapp/components/CustomButton.dart';
import 'package:exekevistaapp/components/CustomTextLabelInput.dart';
import 'package:flutter/material.dart';
import 'package:exekevistaapp/components/CustomNavBar.dart';
import 'package:exekevistaapp/pages/tirar-foto.dart';
import '../models/client.dart';
import '../models/estruturas.dart';

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
  final TextEditingController _areaCobertura = TextEditingController();
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
  bool _contraAvantamentoCompleMetalicaController = false;
  bool _agulhamentoCompleMetalicaController = false;

  // Estrutura Madeira

  // Informações tesouras
  final TextEditingController _vaoLivreTesMadeiraController =
      TextEditingController();
  final TextEditingController _tipoCorteTesMadeiraController =
      TextEditingController();
  final TextEditingController _altTesMadeiraController =
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
  bool _contraAventamentoCompleConcretoController = false;
  bool _agulhamentoCompleConcretoController = false;
  bool _tiranteCentralCompleConcretoController = false;

  bool _saveData() {
    // Verifica os campos padrão para todos os tipos de estrutura
    if (_numeroModulos.text.isEmpty ||
        _tipoTelha.text.isEmpty ||
        _idadeAparente.text.isEmpty) {
      return false;
    }

    if (_nameEstruct == "Estrutura Metálica") {
      return !(_vaoLivreTesMetalicaController.text.isEmpty ||
          _altTesMetalicaController.text.isEmpty ||
          _altPerfilTesMetalicaController.text.isEmpty ||
          _largPerfilTesMetalicaController.text.isEmpty ||
          _espessuraPerfilTesMetalicaController.text.isEmpty ||
          _disTerMetalicaController.text.isEmpty ||
          _altTerMetalicaController.text.isEmpty ||
          _largPerfilTerMetalicaController.text.isEmpty ||
          _espessPerfTerMetalicaController.text.isEmpty ||
          _perfEnrijecidoTerMetalicaController.text.isEmpty ||
          _disPilaresCompleMetalicaController.text.isEmpty);
    } else if (_nameEstruct == "Estrutura Madeira") {
      return !(_vaoLivreTesMadeiraController.text.isEmpty ||
          _tipoCorteTesMadeiraController.text.isEmpty ||
          _altTesMadeiraController.text.isEmpty ||
          _altCorteTesMadeiraController.text.isEmpty ||
          _largCorteTesMadeiraController.text.isEmpty ||
          _diametroTroncoTesMadeiraController.text.isEmpty ||
          _disTerMadeiraController.text.isEmpty ||
          _altCorteTerMadeiraController.text.isEmpty ||
          _largCorteTerMadeiraController.text.isEmpty ||
          _disPilaresCompleMadeiraController.text.isEmpty ||
          _formaChumbamentoCompleMadeiraController.text.isEmpty);
    } else if (_nameEstruct == "Estrutura Concreto") {
      return !(_vaoLivreTesConcretoController.text.isEmpty ||
          _tipoTravamentoTesConcretoController.text.isEmpty ||
          _disTerConcretoController.text.isEmpty ||
          _tipoTerConcretoController.text.isEmpty);
    }

    return false;
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

  void _nextPage() {
    if (_saveData()) {
      var objectSolicitacao = {};

      if (_nameEstruct == "Estrutura Metálica") {
        EstruturaMetalica estruturaMetalica = EstruturaMetalica(
          tipoEstrutura: "metalica",
          areaCobertura: _areaCobertura.text,
          numeroModulos: _numeroModulos.text,
          tipoTelha: _tipoTelha.text,
          idadeAparente: _idadeAparente.text,
          vaoLivreTesoura: _vaoLivreTesMetalicaController.text,
          alturaTesoura: _altTesMetalicaController.text,
          alturaPerfilTesoura: _altPerfilTesMetalicaController.text,
          larguraPerfilTesoura: _largPerfilTesMetalicaController.text,
          espessuraPerfilTesoura: _espessuraPerfilTesMetalicaController.text,
          distanciaTer: _disTerMetalicaController.text,
          alturaTer: _altTerMetalicaController.text,
          larguraPerfilTer: _largPerfilTerMetalicaController.text,
          espessuraPerfilTer: _espessPerfTerMetalicaController.text,
          perfilEnrijecidoTer: _perfEnrijecidoTerMetalicaController.text,
          distanciaPilaresComple: _disPilaresCompleMetalicaController.text,
          contraAvantamentoComple: _contraAvantamentoCompleMetalicaController,
          agulhamentoComple: _agulhamentoCompleMetalicaController,
        );
        objectSolicitacao = {
          "cliente": widget.cliente.toJson(),
          "tipo_estrutura": estruturaMetalica.toJson()["tipo_estrutura"],
          "estrutura": estruturaMetalica.toJson()["estrutura"],
          "solicitacao": {"id_usuario": 2}
        };
      } else if (_nameEstruct == "Estrutura Madeira") {
        EstruturaMadeira estruturaMadeira = EstruturaMadeira(
          tipoEstrutura: "madeira",
          areaCobertura: _areaCobertura.text,
          numeroModulos: _numeroModulos.text,
          tipoTelha: _tipoTelha.text,
          idadeAparente: _idadeAparente.text,
          vaoLivreTesoura: _vaoLivreTesMadeiraController.text,
          tipoCorteTesoura: _tipoCorteTesMadeiraController.text,
          alturaTesoura: _altTesMadeiraController.text,
          alturaCorteTesoura: _altCorteTesMadeiraController.text,
          larguraCorteTesoura: _largCorteTesMadeiraController.text,
          diametroTroncoTesoura: _diametroTroncoTesMadeiraController.text,
          distanciaTer: _disTerMadeiraController.text,
          alturaCorteTer: _altCorteTerMadeiraController.text,
          larguraCorteTer: _largCorteTerMadeiraController.text,
          distanciaPilaresComple: _disPilaresCompleMadeiraController.text,
          formaChumbamentoComple: _formaChumbamentoCompleMadeiraController.text,
        );

        objectSolicitacao = {
          "cliente": widget.cliente.toJson(),
          "tipo_estrutura": estruturaMadeira.toJson()["tipo_estrutura"],
          "estrutura": estruturaMadeira.toJson()["estrutura"],
          "solicitacao": {"id_usuario": 2}
        };
        // Passe 'estruturaMadeira' para a próxima tela se necessário
      } else if (_nameEstruct == "Estrutura Concreto") {
        EstruturaConcreto estruturaConcreto = EstruturaConcreto(
          tipoEstrutura: "concreto",
          areaCobertura: _areaCobertura.text,
          numeroModulos: _numeroModulos.text,
          tipoTelha: _tipoTelha.text,
          idadeAparente: _idadeAparente.text,
          vaoLivreTesoura: _vaoLivreTesConcretoController.text,
          tipoTravamentoTesoura: _tipoTravamentoTesConcretoController.text,
          distanciaTer: _disTerConcretoController.text,
          tipoTer: _tipoTerConcretoController.text,
          contraAventamentoComple: _contraAventamentoCompleConcretoController,
          agulhamentoComple: _agulhamentoCompleConcretoController,
          tiranteCentralComple: _tiranteCentralCompleConcretoController,
        );

        objectSolicitacao = {
          "cliente": widget.cliente.toJson(),
          "tipo_estrutura": estruturaConcreto.toJson()["tipo_estrutura"],
          "estrutura": estruturaConcreto.toJson()["estrutura"]
        };
        // Passe 'estruturaConcreto' para a próxima tela se necessário
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              TirarFoto(objectSolicitacaoFinal: objectSolicitacao),
        ),
      );
    } else {
      _showAlertDialog();
    }
  }

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
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller: _areaCobertura,
                        nameLabel: "Área de cobertura"),
                  ],
                ),
                Row(
                  children: <CustomTextLabelInput>[
                    CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller: _numeroModulos,
                        nameLabel: "Números de módulos"),
                  ],
                ),
                Row(
                  children: <CustomTextLabelInput>[
                    CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller: _idadeAparente,
                        nameLabel: "Idade aparente"),
                  ],
                ),
                Row(
                  children: <CustomTextLabelInput>[
                    CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller: _tipoTelha,
                        nameLabel: "Tipo de telha"),
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
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _vaoLivreTesMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Vão livre",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _tipoCorteTesMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Tipo de corte",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _altTesMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Altura da tesoura",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _altCorteTesMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Altura do corte",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _largCorteTesMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Largura do corte",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
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
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _disTerMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Distâncias das terças",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _altCorteTerMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Altura do corte",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
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
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _disPilaresCompleMadeiraController, // Adicionei o controlador aqui
                        nameLabel: "Distâncias entre pilares",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
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
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _vaoLivreTesConcretoController, // Adicionei o controlador aqui
                        nameLabel: "Vão livre",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "Travamento lateral",
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
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _disTerConcretoController, // Adicionei o controlador aqui
                        nameLabel: "Distâncias das terças",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "Terças metálicas",
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
                    children: <Widget>[
                      const Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Possui contraventamento",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Checkbox(
                        value: _contraAventamentoCompleConcretoController,
                        onChanged: (bool? value) {
                          setState(() {
                            _contraAventamentoCompleConcretoController = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Possui agulhamento",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Checkbox(
                        value: _agulhamentoCompleConcretoController,
                        onChanged: (bool? value) {
                          setState(() {
                            _agulhamentoCompleConcretoController = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Possui tirante central",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Checkbox(
                        value: _tiranteCentralCompleConcretoController,
                        onChanged: (bool? value) {
                          setState(() {
                            _tiranteCentralCompleConcretoController = value!;
                          });
                        },
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
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _vaoLivreTesMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Vão livre",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _altTesMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Altura da tesoura",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _altPerfilTesMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Altura do perfil",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _largPerfilTesMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Largura do perfil",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
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
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _disTerMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Distâncias das terças",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _altTerMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Altura das terças",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _largPerfilTerMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Largura do perfil",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _espessPerfTerMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Espessura do perfil",
                      ),
                    ],
                  ),
                  Row(
                    children: <CustomTextLabelInput>[
                      CustomTextLabelInput(
                        valorPadrao: "1.40",
                        isNumber: true,
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
                        valorPadrao: "1.40",
                        isNumber: true,
                        controller:
                            _disPilaresCompleMetalicaController, // Adicionei o controlador aqui
                        nameLabel: "Distâncias entre pilares",
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Contraventamento",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Checkbox(
                        value: _contraAvantamentoCompleMetalicaController,
                        onChanged: (bool? value) {
                          setState(() {
                            _contraAvantamentoCompleMetalicaController = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Agulhamento",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Checkbox(
                        value: _agulhamentoCompleMetalicaController,
                        onChanged: (bool? value) {
                          setState(() {
                            _agulhamentoCompleMetalicaController = value!;
                          });
                        },
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
                      _nextPage();
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
