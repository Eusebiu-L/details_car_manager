import 'package:flutter/material.dart';
import '../models/car.dart';

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
            TextField(
              readOnly: true,
              controller: startDateController,
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
                      setState(() {
                        selectedDate = picked;
                        startDateController.text =
                            '${picked.day}/${picked.month}/${picked.year}';
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: daysValidController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valid For (days)',
                hintText: '365',
                suffixText: 'days',
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Expiry Date (Auto-calculated):',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${selectedDate.add(Duration(days: int.tryParse(daysValidController.text) ?? 365)).day}/'
                    '${selectedDate.add(Duration(days: int.tryParse(daysValidController.text) ?? 365)).month}/'
                    '${selectedDate.add(Duration(days: int.tryParse(daysValidController.text) ?? 365)).year}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
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

            Car updatedCar;
            if (widget.docType == 'Insurance') {
              updatedCar = Car(
                id: widget.car.id,
                name: widget.car.name,
                imagePath: widget.car.imagePath,
                insuranceExpiry: expiryDate,
                itpExpiry: widget.car.itpExpiry,
                rovignetteExpiry: widget.car.rovignetteExpiry,
              );
            } else if (widget.docType == 'ITP') {
              updatedCar = Car(
                id: widget.car.id,
                name: widget.car.name,
                imagePath: widget.car.imagePath,
                insuranceExpiry: widget.car.insuranceExpiry,
                itpExpiry: expiryDate,
                rovignetteExpiry: widget.car.rovignetteExpiry,
              );
            } else {
              // Vignette
              updatedCar = Car(
                id: widget.car.id,
                name: widget.car.name,
                imagePath: widget.car.imagePath,
                insuranceExpiry: widget.car.insuranceExpiry,
                itpExpiry: widget.car.itpExpiry,
                rovignetteExpiry: expiryDate,
              );
            }

            widget.onSave(updatedCar);
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
