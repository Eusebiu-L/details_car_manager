import 'package:flutter/material.dart';
import '../utils/expiry_status_helper.dart';
import '../utils/date_utils.dart';
import '../common/app_colors.dart';

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

  @override
  Widget build(BuildContext context) {
    final backgroundColor = ExpiryStatusHelper.getStatusBackgroundColor(expiryDate);
    final borderColor = ExpiryStatusHelper.getStatusColor(expiryDate);

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
                  'Expiry: ${DateTimeHelper.formatDate(expiryDate)}',
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
              color: borderColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              ExpiryStatusHelper.getStatusLabel(expiryDate),
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
