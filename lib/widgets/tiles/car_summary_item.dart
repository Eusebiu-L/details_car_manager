import 'package:flutter/material.dart';
import '../../utils/date_utils.dart';
import '../../utils/expiry_status_helper.dart';

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
    // Determine color based on expiry status
    final color = ExpiryStatusHelper.getStatusColor(date);

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
          DateTimeHelper.formatDate(date),
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
