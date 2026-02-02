import 'package:flutter/material.dart';
import '../common/app_colors.dart';
import 'date_utils.dart';

/// Helper class for determining expiry status colors and states.
/// 
/// Centralizes the logic for checking document expiry status and returning
/// appropriate colors for UI display. Eliminates code duplication across widgets.
class ExpiryStatusHelper {
  /// Determine the appropriate color based on expiry status.
  /// 
  /// Returns:
  /// - Red for expired documents
  /// - Yellow for documents expiring within 7 days
  /// - Green for valid documents
  static Color getStatusColor(DateTime date) {
    if (DateTimeHelper.isExpired(date)) return AppColors.expiredRed;
    if (DateTimeHelper.isExpiringSoon(date)) return AppColors.warningYellow;
    return AppColors.validGreen;
  }

  /// Determine the appropriate background color based on expiry status.
  /// 
  /// Returns:
  /// - Light red for expired documents
  /// - Light yellow for documents expiring within 7 days
  /// - Light green for valid documents
  static Color getStatusBackgroundColor(DateTime date) {
    if (DateTimeHelper.isExpired(date)) return AppColors.expiredRedBackground;
    if (DateTimeHelper.isExpiringSoon(date)) return AppColors.warningYellowBackground;
    return AppColors.validGreenBackground;
  }

  /// Get the status text label for a document.
  /// 
  /// Returns:
  /// - 'EXPIRED' for expired documents
  /// - 'WARNING' for documents expiring within 7 days
  /// - 'VALID' for valid documents
  static String getStatusLabel(DateTime date) {
    if (DateTimeHelper.isExpired(date)) return 'EXPIRED';
    if (DateTimeHelper.isExpiringSoon(date)) return 'WARNING';
    return 'VALID';
  }

  /// Check if a document is in expired state.
  static bool isExpired(DateTime date) => DateTimeHelper.isExpired(date);

  /// Check if a document is expiring soon (within 7 days).
  static bool isExpiringSoon(DateTime date) => DateTimeHelper.isExpiringSoon(date);

  /// Check if a document is valid (not expired and not expiring soon).
  static bool isValid(DateTime date) {
    return !isExpired(date) && !isExpiringSoon(date);
  }
}
