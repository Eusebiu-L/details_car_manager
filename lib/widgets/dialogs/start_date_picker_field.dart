import 'package:flutter/material.dart';

class StartDatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final DateTime selectedDate;
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
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (picked != null) {
              onDateChanged(picked);
            }
          },
        ),
      ),
    );
  }
}
