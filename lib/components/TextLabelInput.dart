import 'package:flutter/material.dart';

class TextLabelInput extends StatelessWidget {
  const TextLabelInput({Key? key, required this.nameLabel}) : super(key: key);
  final String nameLabel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text.rich(
                  TextSpan(text: nameLabel),
                  style: const TextStyle(
                      fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1)),
                )),
            const TextField(
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(255, 251, 214, 1),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ],),
        ),),);
  }
}
