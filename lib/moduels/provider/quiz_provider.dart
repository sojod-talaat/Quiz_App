import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'package:quiz_app/core/utils/datebase_helper.dart';
import 'package:quiz_app/core/utils/quiz_model.dart';
import 'package:quiz_app/core/utils/service_locator.dart';
import 'package:quiz_app/moduels/quiz_result/fail_result.dart';

import '../../core/utils/app_router.dart';

class QuizProvider extends ChangeNotifier {
  QuizProvider() {
    selectQuizQuestions();
    focusNode = FocusNode();
    focusNode.addListener(_onFocusChange);
  }
  TextEditingController quizquestion = TextEditingController();
  TextEditingController quizoptionA = TextEditingController();
  TextEditingController quizoptionB = TextEditingController();
  TextEditingController quizoptionC = TextEditingController();
  TextEditingController quizoptionD = TextEditingController();
  cleartextfeilds() {
    quizquestion.clear();
    quizoptionA.clear();
    quizoptionB.clear();
    quizoptionC.clear();
    quizoptionD.clear();
  }

  late FocusNode focusNode;
  bool isFocused = false;
  void _onFocusChange() {
    isFocused = focusNode.hasFocus;
    notifyListeners();
  }

  DbHelper dbHelper = gett.get<DbHelper>();

  List<QuizModel> quizQuestion = [];
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String dropdownvalue2 = 'A';
  String dropdownvalue = 'A';
  int score = 0;
  check(BuildContext context, String option, int index) {
    if (option == quizQuestion[index].answer) {
      score++;
      notifyListeners();
    }

    if (index + 1 == quizQuestion.length) {
      if (score < 5) {
        Navigator.pushNamed(context, AppRouter.failpage,
            arguments: FailResultPage(score: score));
      } else if (score == 5) {
        Navigator.pushNamed(context, AppRouter.s5page,
            arguments: FailResultPage(score: score));
      } else {
        Navigator.pushNamed(context, AppRouter.sucssespage,
            arguments: FailResultPage(score: score));
      }
    }
    score == 0;

    notifyListeners();
  }

  Future<dynamic> inserttoquiz(QuizModel quizModel) async {
    await dbHelper.insertNewQuestion(quizModel);

    selectQuizQuestions();
  }

  fillLists(List<QuizModel> quizmdel) {
    quizQuestion = quizmdel;
    notifyListeners();
  }

  selectQuizQuestions() async {
    List<QuizModel> QuizAuestionList = await dbHelper.selectAllQuizQuestion();
    fillLists(QuizAuestionList);
  }

  deletQuestion(int id) async {
    await dbHelper.deleteQuestion(id);
    selectQuizQuestions();
    notifyListeners();
  }
}
