import 'package:date_format/date_format.dart';

class DateFormatter {
  static String formatToDate(String date) {
    final _date = DateTime.parse(date).toLocal();
    final _formatted = formatDate(_date, [yyyy, ' ', M, ' ', dd]);
    return _formatted;
  }

  static String formatToYYYYMMDD(String date) {
    final _date = DateTime.parse(date).toLocal();
    final _formatted = formatDate(_date, [yyyy, '-', mm, '-', dd]);
    return _formatted;
  }

  static String formatToDayMonth(String date) {
    final _date = DateTime.parse(date);
    final _formatted = formatDate(_date, [d, ' ', M]);
    return _formatted;
  }

  static String formatToDateHour(String date) {
    final _date = DateTime.parse(date).toLocal();
    final _formatted = formatDate(_date, [d, ' ', M, ' ', h, am]);
    return _formatted;
  }

  static String formatToTime(String date) {
    final _date = DateTime.parse(date).toLocal();
    final _formatted = formatDate(_date, [h, ':', nn, am]);
    return _formatted;
  }

  static String formatToHour(String date) {
    final _date = DateTime.parse(date).toLocal();
    final _formatted = formatDate(_date, [h, am]);
    return _formatted;
  }

  static String formatToDateTime(String date) {
    final _date = DateTime.parse(date).toLocal();
    final _formatted =
        formatDate(_date.toLocal(), [h, ':', nn, am, ' ', d, ' ', M]);
    return _formatted;
  }

  static String formatToHourDate(String date) {
    final _date = DateTime.parse(date).toLocal();
    final _formatted = formatDate(_date, [h, ' ', am, ' ', M, ' ', d]);
    return _formatted;
  }

  static String formatToHourMinDate(String date) {
    final _date = DateTime.parse(date).toLocal();
    final _formatted = formatDate(_date, [h, ':', nn, ' ', M, ' ', d]);
    return _formatted;
  }
}
