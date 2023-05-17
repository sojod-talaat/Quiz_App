import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/utils/app_router.dart';
import 'package:quiz_app/core/utils/colors.dart';
import 'package:quiz_app/core/widgets/appbar.dart';
import 'package:quiz_app/core/widgets/button.dart';
import 'package:quiz_app/moduels/home/presention/view/home_page.dart';
import 'package:quiz_app/moduels/provider/quiz_provider.dart';
import 'package:quiz_app/moduels/quiz_create/quiz_quetions/quiz_questions.dart';

import '../../../quiz_result/fail_result.dart';
import '../../../quiz_result/scuess_result.dart';
import '../../../quiz_result/scuses5_result.dart';
import '../widget/quiz_option_widget.dart';

class StartQuizPage extends StatelessWidget {
  StartQuizPage({Key? key}) : super(key: key);
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(title: 'Quiz App'),
        ),
        body: PageView.builder(
          controller: pageController,
          itemCount: value.quizQuestion.length,
          itemBuilder: (context, index) => Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Question ${value.quizQuestion[index].id}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.tealColor,
                          fontSize: 25),
                    ),
                    TextSpan(
                      text: '/${value.quizQuestion.length}',
                      style: TextStyle(color: AppColors.grey, fontSize: 16),
                    ),
                  ])),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      width: double.infinity,
                      height: 50,
                      text: value.quizQuestion[index].question,
                      borderRadius: 10,
                      isCenter: false,
                      function: () {}),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (pageController.hasClients) {
                        pageController.animateToPage(
                          index + 1,
                          duration: const Duration(milliseconds: 4),
                          curve: Curves.easeInOut,
                        );
                      }
                      value.check(context, 'A', index);
                    },
                    child: QuizOptionWidget(
                      option: value.quizQuestion[index].options![0],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (pageController.hasClients) {
                        pageController.animateToPage(
                          index + 1,
                          duration: const Duration(milliseconds: 4),
                          curve: Curves.easeInOut,
                        );
                      }
                      value.check(context, 'B', index);
                    },
                    child: QuizOptionWidget(
                      option: value.quizQuestion[index].options![1],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (pageController.hasClients) {
                        pageController.animateToPage(
                          index + 1,
                          duration: const Duration(milliseconds: 4),
                          curve: Curves.easeInOut,
                        );
                      }
                      value.check(context, 'C', index);
                    },
                    child: QuizOptionWidget(
                      option: value.quizQuestion[index].options![2],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (pageController.hasClients) {
                        pageController.animateToPage(
                          index + 1,
                          duration: const Duration(milliseconds: 4),
                          curve: Curves.easeInOut,
                        );
                      }
                      value.check(context, 'D', index);
                    },
                    child: QuizOptionWidget(
                      option: value.quizQuestion[index].options![3],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
