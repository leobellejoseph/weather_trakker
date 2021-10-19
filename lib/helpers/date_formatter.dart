import 'package:date_format/date_format.dart';

class DateFormatter {
  static String formatToDate(String date) {
    final _date = DateTime.parse(date);
    final _formatted = formatDate(_date.toLocal(), [d, ' ', M, ' ', yyyy]);
    return _formatted;
  }

  static String formatToYYYYMMDD(String date) {
    final _date = DateTime.parse(date);
    final _formatted = formatDate(_date.toLocal(), [yyyy, '-', mm, '-', dd]);
    return _formatted;
  }

  static String formatToDayMonth(String date) {
    final _date = DateTime.parse(date);
    final _formatted = formatDate(_date.toLocal(), [d, ' ', M]);
    return _formatted;
  }

  static String formatToDateHour(String date) {
    final _date = DateTime.parse(date);
    final _formatted = formatDate(_date.toLocal(), [d, ' ', M, ' ', h, am]);
    return _formatted;
  }

  static String formatToTime(String date) {
    final _date = DateTime.parse(date);
    final _formatted = formatDate(_date.toLocal(), [h, ':', nn, am]);
    return _formatted;
  }

  static String formatToHour(String date) {
    final _date = DateTime.parse(date);
    final _formatted = formatDate(_date.toLocal(), [h, am]);
    return _formatted;
  }

  static String formatToDateTime(String date) {
    final _date = DateTime.parse(date);
    final _formatted =
        formatDate(_date.toLocal(), [h, ':', nn, am, ' ', d, ' ', M]);
    return _formatted;
  }

  static String formatToHourDate(String date) {
    final _date = DateTime.parse(date);
    final _formatted =
        formatDate(_date.toLocal(), [h, ' ', am, ' ', d, ' ', M]);
    return _formatted;
  }
}
