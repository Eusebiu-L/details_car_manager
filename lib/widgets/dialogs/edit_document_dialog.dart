import 'package:flutter/material.dart';
import '../../models/car.dart';
import 'start_date_picker_field.dart';
import 'validity_days_field.dart';
import 'expiry_date_preview.dart';
import 'car_updater.dart';

class EditDocumentDialog extends StatefulWidget {
  final Car car;
  final String docType;
  final DateTime currentDate;
  final Function(Car) onSave;

  const EditDocumentDialog({
    super.key,
    required this.car,
    required this.docType,
    required this.currentDate,
    required this.onSave,
  });

  @override
  State<EditDocumentDialog> createState() => _EditDocumentDialogState();
}

class _EditDocumentDialogState extends State<EditDocumentDialog> {
  late DateTime selectedDate;
  late TextEditingController startDateController;
  late TextEditingController daysValidController;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.currentDate;
    startDateController = TextEditingController(
      text: '${widget.currentDate.day}/${widget.currentDate.month}/${widget.currentDate.year}',
    );
    daysValidController = TextEditingController(text: '365');
  }

  @override
  void dispose() {
    startDateController.dispose();
    daysValidController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit ${widget.docType} - ${widget.car.name}'),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StartDatePickerField(
              controller: startDateController,
              selectedDate: selectedDate,
              onDateChanged: (newDate) {
                setState(() {
                  selectedDate = newDate;
                  startDateController.text =
                      '${newDate.day}/${newDate.month}/${newDate.year}';
                });
              },
            ),
            const SizedBox(height: 16),
            ValidityDaysField(
              controller: daysValidController,
              onChanged: (_) {
                setState(() {});
              },
            ),
            const SizedBox(height: 16),
            ExpiryDatePreview(
              selectedDate: selectedDate,
              daysText: daysValidController.text,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final daysValid = int.tryParse(daysValidController.text) ?? 365;
            final expiryDate = selectedDate.add(Duration(days: daysValid));
            final updatedCar = CarUpdater.updateDocumentExpiry(
              car: widget.car,
              docType: widget.docType,
              expiryDate: expiryDate,
            );

            widget.onSave(updatedCar);
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
