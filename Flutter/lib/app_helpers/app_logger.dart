import 'package:flutter_app/app_helpers/app_configs.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static void logToConsole(String logMessage,
      {String name = "AppLogger...", dynamic loggedData = ''}) {
    if (AppConfigs.isProductionEnv()) return;
    Logger().log(Level.debug, '$name *********** $logMessage');
  }

  static void logErrorToConsole(name, error, stackTrace, {String functionName = ''}) {
    if (AppConfigs.isProductionEnv()) return;
    Logger().log(Level.error, '$name ******* $functionName *****  $error  *** $stackTrace');
  }
}
