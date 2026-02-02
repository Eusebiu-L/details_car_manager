import 'package:flutter/material.dart';

/// Input field for entering the validity period in days.
/// 
/// Accepts numeric input for the number of days a document is valid for.
class ValidityDaysField extends StatelessWidget {
  /// Controller for the days input field
  final TextEditingController controller;
  
  /// Callback when the value changes
  final Function(String) onChanged;

  const ValidityDaysField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Valid For (days)',
        hintText: '365',
        suffixText: 'days',
      ),
      // Notify parent when value changes
      onChanged: onChanged,
    );
  }
}
