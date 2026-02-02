import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import '../../utils/date_utils.dart' as date_helper;

/// Tile widget displaying a car document reminder with status indicator.
/// 
/// Shows document title, expiry date, and visual status (valid/expiring/expired).
/// Colors change based on document expiry status.
class ReminderTile extends StatelessWidget {
  /// Document title (e.g., 'Car Insurance')
  final String title;
  
  /// Date when the document expires
  final DateTime expiryDate;
  
  /// Icon to display for this document type
  final IconData icon;

  const ReminderTile({
    super.key,
    required this.title,
    required this.expiryDate,
    required this.icon,
  });

  bool get isExpired => date_helper.DateTimeHelper.isExpired(expiryDate);
  bool get isExpiringSoon => date_helper.DateTimeHelper.isExpiringSoon(expiryDate);

  @override
  Widget build(BuildContext context) {
    // Determine background color based on expiry status
    Color getBackgroundColor() {
      if (isExpired) return AppColors.expiredRedBackground;
      if (isExpiringSoon) return AppColors.warningYellowBackground;
      return AppColors.validGreenBackground;
    }

    // Determine border color based on expiry status
    Color getBorderColor() {
      if (isExpired) return AppColors.expiredRed;
      if (isExpiringSoon) return AppColors.warningYellow;
      return AppColors.validGreen;
    }

    final backgroundColor = getBackgroundColor();
    final borderColor = getBorderColor();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: borderColor, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Expiry: ${date_helper.DateTimeHelper.formatDate(expiryDate)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isExpired
                  ? AppColors.expiredRed
                  : (isExpiringSoon ? AppColors.warningYellow : AppColors.validGreen),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              isExpired ? 'EXPIRED' : (isExpiringSoon ? 'WARNING' : 'VALID'),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
