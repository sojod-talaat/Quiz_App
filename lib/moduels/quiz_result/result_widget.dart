import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/utils/app_router.dart';
import 'package:quiz_app/core/utils/styles.dart';
import 'package:quiz_app/core/widgets/button.dart';
import 'package:quiz_app/moduels/provider/quiz_provider.dart';

class ResultWidget extends StatelessWidget {
  String title;
  int score;
  String bodytext;
  String imageassets;
  double? width;
  double? height;

  ResultWidget(
      {super.key,
      required this.score,
      required this.bodytext,
      required this.title,
      required this.imageassets,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Styles.text18teal.copyWith(fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            imageassets,
            width: width,
            height: height,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Your Score : $score / 10',
            style: Styles.textGreen,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            bodytext,
            style: Styles.text16black.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            borderRadius: 10,
            isCenter: true,
            width: 210,
            height: 50,
            text: 'Back to home',
            function: () {
              Provider.of<QuizProvider>(context, listen: false).score = 0;
              log(Provider.of<QuizProvider>(context, listen: false)
                  .score
                  .toString());
              Navigator.pushReplacementNamed(context, AppRouter.initial);
            },
          )
        ],
      ),
    );
  }
}
