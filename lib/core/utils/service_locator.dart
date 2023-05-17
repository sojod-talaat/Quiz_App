import 'package:get_it/get_it.dart';
import 'package:quiz_app/core/utils/app_router.dart';
import 'package:quiz_app/core/utils/datebase_helper.dart';

final gett = GetIt.instance;

void setupLocator() {
  gett.registerSingleton<AppRouter>;
  gett.registerSingleton<DbHelper>(DbHelper());
}
