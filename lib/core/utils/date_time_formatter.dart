import 'package:intl/intl.dart';

abstract final class DateTimeFormatter {
  static final DateFormat _formatter = DateFormat('dd/MM/yyyy - HH:mm');

  static String format(DateTime value) => _formatter.format(value);

  static String remaining(Duration value) {
    if (value <= Duration.zero) return 'مسموح الآن';
    final days = value.inDays;
    final hours = value.inHours.remainder(24);
    final minutes = value.inMinutes.remainder(60);
    return '$days يوم و$hours ساعة و$minutes دقيقة';
  }
}
