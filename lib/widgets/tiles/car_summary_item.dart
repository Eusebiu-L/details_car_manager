import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../utils/date_utils.dart' as date_helper;

class CarSummaryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final DateTime date;

  const CarSummaryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final isExpired = date_helper.DateTimeHelper.isExpired(date);
    final isExpiringSoon = date_helper.DateTimeHelper.isExpiringSoon(date);

    Color getColor() {
      if (isExpired) return AppColors.expiredRed;
      if (isExpiringSoon) return AppColors.warningYellow;
      return AppColors.validGreen;
    }

    final color = getColor();

    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 28,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          date_helper.DateTimeHelper.formatDate(date),
          style: TextStyle(
            fontSize: 10,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
