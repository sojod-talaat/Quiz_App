import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quiz_app/core/utils/colors.dart';
import 'package:quiz_app/core/widgets/appbar.dart';

import 'package:quiz_app/moduels/provider/quiz_provider.dart';
import '../widget/quiz_option_widget.dart';

// ignore: must_be_immutable
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
                      text: 'Question ${index + 1}  ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.tealColor,
                          fontSize: 25),
                    ),
                    TextSpan(
                      text: '/ ${value.quizQuestion.length}',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ])),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(13),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.tealColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      value.quizQuestion[index].question!,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
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
