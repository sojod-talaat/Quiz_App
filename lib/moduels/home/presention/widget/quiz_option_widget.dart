import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/colors.dart';
import 'package:quiz_app/core/utils/styles.dart';

class QuizOptionWidget extends StatelessWidget {
  String option;
  QuizOptionWidget({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.tealColor, width: 1.5),
      ),
      child: Text(
        option,
        style: Styles.text16black.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
