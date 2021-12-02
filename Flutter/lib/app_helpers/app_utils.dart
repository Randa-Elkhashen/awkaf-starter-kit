import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AppUtils {
  AppUtils._();
  static String timeToString(t) {
    initializeDateFormatting(); //very
    DateTime time = DateTime.parse(t);

    String? dayOfWeek;
    String? dayMonth;
    String? year;

    DateTime now = time; // birthDate;
    dayOfWeek = DateFormat.d('en').format(now);
    dayMonth = DateFormat.M('en').format(now);
    year = DateFormat.y('en').format(now);

    var newTime = '$dayOfWeek / $dayMonth / $year';

    return newTime;
  }
}
