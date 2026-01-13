import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../utils/date_utils.dart' as date_helper;

class ReminderTile extends StatelessWidget {
  final String title;
  final DateTime expiryDate;
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
    Color getBackgroundColor() {
      if (isExpired) return AppColors.expiredRedBackground;
      if (isExpiringSoon) return AppColors.warningYellowBackground;
      return AppColors.validGreenBackground;
    }

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
