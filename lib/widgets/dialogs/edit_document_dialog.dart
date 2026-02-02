import 'package:flutter/material.dart';
import '../../models/car.dart';
import 'start_date_picker_field.dart';
import 'validity_days_field.dart';
import 'expiry_date_preview.dart';
import 'car_updater.dart';

/// Dialog for editing a car document's expiry date.
/// 
/// Allows users to set a start date and validity period in days, showing
/// a preview of the calculated expiry date before saving.
class EditDocumentDialog extends StatefulWidget {
  /// The car being edited
  final Car car;
  
  /// Type of document being edited (Insurance, ITP, or Vignette)
  final String docType;
  
  /// Current expiry date for the document
  final DateTime currentDate;
  
  /// Callback when the document is saved with new expiry date
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
  /// Currently selected start date
  late DateTime selectedDate;
  
  /// Controller for the start date input field
  late TextEditingController startDateController;
  
  /// Controller for the validity days input field
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
    // Clean up controllers
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
                  // Update display with new date format
                  startDateController.text =
                      '${newDate.day}/${newDate.month}/${newDate.year}';
                });
              },
            ),
            const SizedBox(height: 16),
            ValidityDaysField(
              controller: daysValidController,
              onChanged: (_) {
                // Rebuild to update preview
                setState(() {});
              },
            ),
            const SizedBox(height: 16),
            // Show calculated expiry date preview
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
            // Parse validity days, default to 365 if invalid
            final daysValid = int.tryParse(daysValidController.text) ?? 365;
            // Calculate the expiry date
            final expiryDate = selectedDate.add(Duration(days: daysValid));
            // Update the car with new document expiry date
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
