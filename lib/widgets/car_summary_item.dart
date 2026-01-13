import 'package:flutter/material.dart';

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
    final now = DateTime.now();
    final isExpired = date.isBefore(now);
    final isExpiringSoon = !isExpired && date.difference(now).inDays <= 7;

    Color getColor() {
      if (isExpired) return Colors.red;
      if (isExpiringSoon) return Colors.yellow[600]!;
      return Colors.green;
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
          '${date.day}/${date.month}/${date.year}',
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
