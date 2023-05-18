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
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, left: 10, right: 100, bottom: 19),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: Text(
        option,
        style: TextStyle(color: textcolor, fontSize: 13),
      ),
    );
  }
}
