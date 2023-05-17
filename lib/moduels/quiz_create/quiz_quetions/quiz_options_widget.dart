import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuizQustionsOptions extends StatelessWidget {
  QuizQustionsOptions(
      {required this.option,
      required this.color,
      required this.textcolor,
      super.key});
  String option;
  Color color;
  Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 50,
      child: Text(
        option,
        style: TextStyle(color: textcolor),
      ),
    );
  }
}
