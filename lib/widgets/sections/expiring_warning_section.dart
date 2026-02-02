import 'package:flutter/material.dart';
import '../../models/car.dart';
import '../../common/app_colors.dart';

/// Warning section widget displaying documents expiring within 7 days.
/// 
/// Shows a prominent yellow warning banner with a list of cars and documents
/// that will expire soon. Hidden if no documents are expiring.
class ExpiringWarningSection extends StatelessWidget {
  /// List of car-document pairs expiring in the next 7 days
  final List<MapEntry<Car, String>> expiringDocs;

  const ExpiringWarningSection({super.key, required this.expiringDocs});

  @override
  Widget build(BuildContext context) {
    // Hide section if no documents are expiring
    if (expiringDocs.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      color: AppColors.warningYellow,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.schedule, color: Colors.white),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Expiring in 7 days',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // List each expiring document
          ...expiringDocs.map((entry) {
            final car = entry.key;
            final docType = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    // Icon based on document type
                    Icon(
                      docType == 'Insurance'
                          ? Icons.shield
                          : docType == 'ITP'
                              ? Icons.build
                              : Icons.local_parking,
                      color: AppColors.warningYellow,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            car.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            docType,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.error_outline,
                      color: AppColors.warningYellow,
                      size: 20,
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
