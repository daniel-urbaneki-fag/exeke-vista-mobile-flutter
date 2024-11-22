import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextLabelInput extends StatefulWidget {
  const CustomTextLabelInput({
    Key? key,
    required this.nameLabel,
    required this.controller,
    required this.valorPadrao,
    this.isNumber =
        false, // Adicionando a opção para controlar se será número ou string
  }) : super(key: key);

  final String nameLabel;
  final String valorPadrao;
  final TextEditingController controller;
  final bool isNumber; // Propriedade para verificar se o campo é numérico

  @override
  _CustomTextLabelInputState createState() => _CustomTextLabelInputState();
}

class _CustomTextLabelInputState extends State<CustomTextLabelInput> {
  @override
  void initState() {
    super.initState();
    widget.controller.text = widget.valorPadrao;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.nameLabel,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
              TextField(
                controller: widget.controller,
                style: const TextStyle(fontSize: 16),
                keyboardType: widget.isNumber
                    ? TextInputType.numberWithOptions(decimal: true)
                    : TextInputType.text, // Altera para número ou texto
                inputFormatters: widget.isNumber
                    ? [
                        FilteringTextInputFormatter.allow(RegExp(
                            r'[0-9.,]')), // Permite números e vírgula/ponto
                      ]
                    : [], // Não aplica filtro se não for número
                decoration: const InputDecoration(
                  fillColor: Color.fromRGBO(255, 251, 214, 1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onChanged: (text) {
                  // Aqui você pode capturar o valor em tempo real, caso precise
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
