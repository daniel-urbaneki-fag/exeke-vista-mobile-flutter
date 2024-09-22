import 'package:flutter/material.dart';

class CustomTextLabelInput extends StatefulWidget {
  const CustomTextLabelInput({
    Key? key,
    required this.nameLabel,
    required this.controller,
  }) : super(key: key);

  final String nameLabel;
  final TextEditingController controller; // Utilize o controlador passado

  @override
  _CustomTextLabelInputState createState() => _CustomTextLabelInputState();
}

class _CustomTextLabelInputState extends State<CustomTextLabelInput> {
  @override
  void initState() {
    super.initState();
    // Definir o valor padrão
    widget.controller.text = "Valor padrão"; // Coloque o valor que você deseja
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
                controller: widget.controller, // Use o controlador passado
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  fillColor: Color.fromRGBO(255, 251, 214, 1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onChanged: (text) {
                  // Aqui você pode capturar o valor em tempo real
                  // print("Valor digitado: $text");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
