/// Helper utility class for date operations and formatting.
/// 
/// Provides static methods for checking document expiry status and formatting dates.
class DateTimeHelper {
  /// Check if a date has already passed (expired).
  /// 
  /// Returns true if the date is before the current date and time.
  static bool isExpired(DateTime date) {
    return date.isBefore(DateTime.now());
  }

  /// Check if a date is expiring within 7 days.
  /// 
  /// Returns true if the date is in the future but within the next 7 days.
  static bool isExpiringSoon(DateTime date) {
    final now = DateTime.now();
    return !isExpired(date) && date.difference(now).inDays <= 7;
  }

  /// Get days remaining until expiry.
  /// 
  /// Returns the number of days between now and the expiry date.
  /// Can be negative if date has already passed.
  static int daysUntilExpiry(DateTime date) {
    return date.difference(DateTime.now()).inDays;
  }

  /// Format date as DD/MM/YYYY.
  /// 
  /// Converts a DateTime object to a human-readable string format.
  static String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
