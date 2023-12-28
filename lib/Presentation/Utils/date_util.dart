import 'package:intl/intl.dart';

class DateUtil {
  // date and time
  static String getFormattedDate(String apiDate) {
    DateTime apiDateTime = DateTime.parse(apiDate);
    String formattedDate =
        DateFormat('yyyy MMMM dd, HH:MM a').format(apiDateTime);
    return formattedDate;
  }

  // only date
  static String getFormattedDateOnly(String apiDate) {
    DateTime apiDateTime = DateTime.parse(apiDate);
    String formattedDate = DateFormat('yyyy MMMM dd').format(apiDateTime);
    return formattedDate;
  }

  // only time
  static String getFormattedTimeOnly(String apiDate) {
    DateTime apiDateTime = DateTime.parse(apiDate);
    String formattedDate = DateFormat('HH:MM a').format(apiDateTime);
    return formattedDate;
  }
}
