import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/assets_constant.dart';
import 'package:quiz_app/core/widgets/appbar.dart';
import 'package:quiz_app/moduels/quiz_result/result_widget.dart';

class FailResultPage extends StatelessWidget {
  FailResultPage({super.key, required this.score});
  int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(title: 'Quiz App'),
      ),
      body: Center(
        child: ResultWidget(
          score: score,
          bodytext: 'Sorry, better lunck next time!',
          title: 'Oops!',
          imageassets: AppAssets.failimage,
          width: 200,
        ),
      ),
    );
  }
}
