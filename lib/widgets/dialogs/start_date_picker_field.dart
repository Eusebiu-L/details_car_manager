import 'package:flutter/material.dart';

/// Input field for selecting a document's start date (valid from date).
/// 
/// Shows a read-only text field with a calendar picker button to select dates.
class StartDatePickerField extends StatelessWidget {
  /// Controller for the date text field
  final TextEditingController controller;
  
  /// Currently selected date
  final DateTime selectedDate;
  
  /// Callback when date is changed
  final Function(DateTime) onDateChanged;

  const StartDatePickerField({
    super.key,
    required this.controller,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Start Date (Valid From)',
        // Calendar icon button to open date picker
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            // Update if user selected a date
            if (picked != null) {
              onDateChanged(picked);
            }
          },
        ),
      ),
    );
  }
}
