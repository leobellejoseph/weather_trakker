import 'package:date_format/date_format.dart';

class DateFormatter {
  static String formatToDate(String date) {
    final _date = DateTime.parse(date);
    final _formatted = formatDate(_date.toLocal(), [d, ' ', M, ' ', yyyy]);
    return _formatted;
  }

  static String formatToTime(String date) {
    final _date = DateTime.parse(date);
    final _formatted = formatDate(_date.toLocal(), [h, ':', nn, am]);
    return _formatted;
  }
}
