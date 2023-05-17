import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/app_router.dart';
import 'package:quiz_app/core/utils/assets_constant.dart';
import 'package:quiz_app/core/utils/styles.dart';
import 'package:quiz_app/core/widgets/appbar.dart';
import 'package:quiz_app/core/widgets/button.dart';

import '../../quiz_result/result_widget.dart';

class InvaildNumberOfQuestion extends StatelessWidget {
  const InvaildNumberOfQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(title: 'Quiz App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sorry!',
                style: Styles.text18teal.copyWith(fontSize: 35),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'You must add at least 5 questions to start',
                style: Styles.text16black.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                AppAssets.faqimage,
                width: 220,
                height: 220,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    borderRadius: 10,
                    isCenter: true,
                    width: 230,
                    height: 50,
                    text: 'Back to home',
                    function: () {
                      Navigator.pushNamed(context, AppRouter.initial);
                    }),
              )
            ],
          ),
        ));
  }
}
