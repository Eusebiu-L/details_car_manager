import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

/// Preview widget showing the calculated expiry date.
/// 
/// Displays a visual preview of what the expiry date will be based on
/// the selected start date and validity period in days.
class ExpiryDatePreview extends StatelessWidget {
  /// The selected start date
  final DateTime selectedDate;
  
  /// The validity period in days (as text from input field)
  final String daysText;

  const ExpiryDatePreview({
    super.key,
    required this.selectedDate,
    required this.daysText,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate expiry date by adding days to start date
    final expiryDate = selectedDate.add(
      Duration(days: int.tryParse(daysText) ?? 365),
    );

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Expiry Date (Auto-calculated):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '${expiryDate.day}/${expiryDate.month}/${expiryDate.year}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryPurple,
            ),
          ),
        ],
      ),
    );
  }
}
