// ignore: file_names
import 'package:flutter/material.dart';
import 'package:exekevistaapp/components/CustomButton.dart';
import 'package:exekevistaapp/components/CustomNavBar.dart';

class Relatorio extends StatefulWidget {
  const Relatorio({super.key, required this.nameEstruct});

  final String nameEstruct;

  @override
  RelatorioState createState() => RelatorioState();
}

class RelatorioState extends State<Relatorio> {
  late String _nameEstruct;
  late bool _isVisible = false;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                      nameLabelButton: "Relatório",
                      navigationFunction: (context) {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                    ),
                    Visibility(
                      visible: !_isVisible,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "001 | Bionova | Energia Solar Ltda | EM ANDAMENTO ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  "002 | Solar | Sistema de Solar Ltda | CONCLUÍDO",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  "003 | Energise | Energia Renovável Ltda | CONCLUÍDO",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
