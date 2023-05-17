import 'package:quiz_app/core/utils/quiz_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer';
import 'package:path/path.dart';

class DbHelper {
  Database? database;

  initDatabase() async {
    database = await createConnectionWithDatabase();
  }

  String quiztable2 = 'quizTable2';
  String idColumn = 'id';
  String qustionColumn = 'question';
  String optionsColumn = 'options';
  String answerColumn = 'answer';

  Future<Database> createConnectionWithDatabase() async {
    String databasePath = await getDatabasesPath();
    String databaseName = 'quiz.db';
    String fullPath = join(databasePath, databaseName);
    Database database =
        await openDatabase(fullPath, version: 1, onCreate: (db, i) {
      log('hello, the database has been created');
      db.execute('''
 CREATE TABLE $quiztable2 (
  $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
   $qustionColumn TEXT,
    $optionsColumn TEXT,
    $answerColumn TEXT
    )
''');
    }, onOpen: (db) async {
      final tables =
          await db.rawQuery('SELECT name FROM sqlite_master ORDER BY name;');
      log(tables.toString());
    });
    return database;
  }

  insertNewQuestion(QuizModel quizModel) async {
    int rowIndex = await database!.insert(quiztable2, quizModel.toMap());
    log(rowIndex.toString());
  }

  Future<List<QuizModel>> selectAllQuizQuestion() async {
    List<Map<String, Object?>> rowsAsMaps = await database!.query(quiztable2);
    List<QuizModel> experinces =
        rowsAsMaps.map((e) => QuizModel.fromMap(e)).toList();
    return experinces;
  }

  Future<void> deleteQuestion(int id) async {
    await database!.delete(quiztable2, where: '$idColumn=?', whereArgs: [id]);
    id = 0;
    selectAllQuizQuestion();
  }
}
