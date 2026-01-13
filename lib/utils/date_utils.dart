class DateTimeHelper {
  /// Check if a date has already passed
  static bool isExpired(DateTime date) {
    return date.isBefore(DateTime.now());
  }

  /// Check if a date is expiring within 7 days
  static bool isExpiringSoon(DateTime date) {
    final now = DateTime.now();
    return !isExpired(date) && date.difference(now).inDays <= 7;
  }

  /// Get days remaining until expiry
  static int daysUntilExpiry(DateTime date) {
    return date.difference(DateTime.now()).inDays;
  }

  /// Format date as DD/MM/YYYY
  static String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
