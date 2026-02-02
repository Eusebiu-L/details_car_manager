import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../utils/date_utils.dart' as date_helper;

/// Compact summary item showing a document with its expiry date and status.
/// 
/// Used in the summary section of car details to display all three documents
/// (Insurance, ITP, Vignette) in a compact column format with color-coded status.
class CarSummaryItem extends StatelessWidget {
  /// Icon to display for this document
  final IconData icon;
  
  /// Label text for the document
  final String label;
  
  /// Expiry date for the document
  final DateTime date;

  const CarSummaryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    // Check document status
    final isExpired = date_helper.DateTimeHelper.isExpired(date);
    final isExpiringSoon = date_helper.DateTimeHelper.isExpiringSoon(date);

    // Determine color based on expiry status
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
