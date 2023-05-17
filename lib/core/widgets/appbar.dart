import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/colors.dart';
import 'package:quiz_app/core/utils/styles.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  String title;
  CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      title: Text(
        title,
        style: Styles.text18,
      ),
      backgroundColor: AppColors.tealColor,
      centerTitle: true,
    );
  }
}
