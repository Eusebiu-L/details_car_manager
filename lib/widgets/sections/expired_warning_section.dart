import 'package:flutter/material.dart';

class ExpiredWarningSection extends StatelessWidget {
  final int expiredCount;

  const ExpiredWarningSection({super.key, required this.expiredCount});

  @override
  Widget build(BuildContext context) {
    if (expiredCount == 0) {
      return const SizedBox.shrink();
    }

    return Container(
      color: Colors.yellow[100],
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(Icons.warning, color: Colors.amber[800], size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '$expiredCount car(s) with expired documents',
              style: TextStyle(
                color: Colors.amber[900],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
