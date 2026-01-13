import 'package:flutter/material.dart';

class ValidityDaysField extends StatelessWidget {
  final TextEditingController controller;
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
      onChanged: onChanged,
    );
  }
}
