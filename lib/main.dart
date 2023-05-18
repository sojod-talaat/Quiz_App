import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/utils/app_router.dart';
import 'package:quiz_app/core/utils/datebase_helper.dart';
import 'package:quiz_app/core/utils/service_locator.dart';
import 'package:quiz_app/moduels/provider/quiz_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await gett.get<DbHelper>().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuizProvider>(
      create: (context) => QuizProvider(),
      child: const MaterialApp(
        onGenerateRoute: AppRouter.generatedRoute,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.initial,
      ),
    );
  }
}
