import 'package:flutter/material.dart';

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

  bool get isExpired {
    return expiryDate.isBefore(DateTime.now());
  }

  bool get isExpiringSoon {
    final now = DateTime.now();
    return !isExpired && expiryDate.difference(now).inDays <= 7;
  }

  @override
  Widget build(BuildContext context) {
    Color getBackgroundColor() {
      if (isExpired) return Colors.red[100]!;
      if (isExpiringSoon) return Colors.yellow[100]!;
      return Colors.green[100]!;
    }

    Color getBorderColor() {
      if (isExpired) return Colors.red;
      if (isExpiringSoon) return Colors.yellow[600]!;
      return Colors.green;
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
                  'Expiry: ${expiryDate.day}/${expiryDate.month}/${expiryDate.year}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isExpired ? Colors.red : (isExpiringSoon ? Colors.yellow[600]! : Colors.green),
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
