import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.nameLabelButton,
      required this.navigationFunction,
      this.color = const Color.fromRGBO(196, 196, 196, 0.289)});
  final String nameLabelButton;
  final void Function(BuildContext) navigationFunction;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: color, elevation: 0),
          child: Text.rich(
            TextSpan(text: nameLabelButton),
            style: TextStyle(
                fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
          ),
          onPressed: () {
            navigationFunction(context);
          },
        ));
  }
}
