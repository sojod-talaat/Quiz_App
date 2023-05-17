import 'package:quiz_app/core/utils/datebase_helper.dart';
import 'package:quiz_app/core/utils/service_locator.dart';

class QuizModel {
  int? id;
  String? question;
  List<String>? options;
  String? answer;

  QuizModel(
      {required this.question, required this.options, required this.answer});
  DbHelper db = gett.get<DbHelper>();
  QuizModel.fromMap(Map<String, dynamic> map) {
    id = map[db.idColumn];
    question = map[db.qustionColumn];
    options = map[db.optionsColumn].split(',');
    answer = map[db.answerColumn];
  }
  Map<String, dynamic> toMap() {
    return {
      db.qustionColumn: question,
      db.answerColumn: answer,
      db.optionsColumn: options?.join(','),
    };
  }
}
