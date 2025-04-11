// lib/core/utils/date_formatter.dart
class DateFormatter {
  static String formatMatchDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
  static String formatTimeDate(DateTime date) {
    return '${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
  
  static String formatHistoryDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}