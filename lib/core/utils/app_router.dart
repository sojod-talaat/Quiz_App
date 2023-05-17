import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/moduels/home/presention/view/home_page.dart';
import 'package:quiz_app/moduels/provider/quiz_provider.dart';
import 'package:quiz_app/moduels/quiz_create/add_questuins/invaild_number_question.dart';
import 'package:quiz_app/moduels/quiz_create/quiz_quetions/quiz_questions.dart';

import '../../moduels/home/presention/view/start_quiz_page.dart';
import '../../moduels/quiz_create/add_questuins/add_question.dart';
import '../../moduels/quiz_result/fail_result.dart';
import '../../moduels/quiz_result/scuess_result.dart';
import '../../moduels/quiz_result/scuses5_result.dart';

abstract class AppRouter {
  static const String initial = '/';
  static const String addnewquestion = '/AddNewQuestion';
  static const String quizquestion = '/QuizQuestion';
  static const String startquiz = '/StatrQuiz';
  static const String invaildnumberofq = '/inavaild';
  static const String sucssespage = '/sucsespage';
  static const String failpage = '/failpage';
  static const String s5page = '/s5page';

  static Route? generatedRoute(RouteSettings settings) {
    String x = '';
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case addnewquestion:
        return MaterialPageRoute(
          builder: (_) => const AddQuestionPage(),
        );
      case quizquestion:
        return MaterialPageRoute(
          builder: (_) => const QuizQuestions(),
        );
      case startquiz:
        return MaterialPageRoute(
          builder: (_) => StartQuizPage(),
        );
      case invaildnumberofq:
        return MaterialPageRoute(
          builder: (_) => const InvaildNumberOfQuestion(),
        );
      case sucssespage:
        return MaterialPageRoute(
          builder: (BuildContext context) => SucsessResultPage(
            score: Provider.of<QuizProvider>(context, listen: false).score,
          ),
        );
      case s5page:
        return MaterialPageRoute(
          builder: (BuildContext context) => SucsessResult5Page(
            score: Provider.of<QuizProvider>(context, listen: false).score,
          ),
        );
      case failpage:
        return MaterialPageRoute(
          builder: (BuildContext context) => FailResultPage(
            score: Provider.of<QuizProvider>(context, listen: false).score,
          ),
        );
    }
    return null;
  }
}
