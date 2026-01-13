import 'package:flutter/material.dart';
import '../models/car.dart';
import '../widgets/tiles/reminder_tile.dart';
import '../widgets/tiles/car_summary_item.dart';
import '../widgets/dialogs/edit_document_dialog.dart';
import '../constants/app_colors.dart';

class CarDetailsScreen extends StatefulWidget {
  final Car car;

  const CarDetailsScreen({super.key, required this.car});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  late Car car;

  @override
  void initState() {
    super.initState();
    car = widget.car;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name),
        elevation: 0,
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Car Details Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Car Name and ID
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.lightPurple,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primaryPurple, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryPurple,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.info_outline, size: 18),
                            const SizedBox(width: 8),
                            Text(
                              'ID: ${car.id}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Reminders Section Title
                  const Text(
                    'Document Reminders',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Insurance Reminder
                  GestureDetector(
                    onTap: () => _editDocumentDate('Insurance', car.insuranceExpiry),
                    child: ReminderTile(
                      title: 'Car Insurance',
                      expiryDate: car.insuranceExpiry,
                      icon: Icons.shield,
                    ),
                  ),
                  // ITP Reminder
                  GestureDetector(
                    onTap: () => _editDocumentDate('ITP', car.itpExpiry),
                    child: ReminderTile(
                      title: 'Technical Inspection (ITP)',
                      expiryDate: car.itpExpiry,
                      icon: Icons.build,
                    ),
                  ),
                  // Rovigiette Reminder
                  GestureDetector(
                    onTap: () => _editDocumentDate('Vignette', car.rovignetteExpiry),
                    child: ReminderTile(
                      title: 'Road Vignette (Rovignetă)',
                      expiryDate: car.rovignetteExpiry,
                      icon: Icons.local_parking,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Summary Section
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.lightPurple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CarSummaryItem(
                          icon: Icons.shield,
                          label: 'Insurance',
                          date: car.insuranceExpiry,
                        ),
                        Container(
                          width: 1,
                          height: 60,
                          color: AppColors.greyBorder,
                        ),
                        CarSummaryItem(
                          icon: Icons.build,
                          label: 'ITP',
                          date: car.itpExpiry,
                        ),
                        Container(
                          width: 1,
                          height: 60,
                          color: AppColors.greyBorder,
                        ),
                        CarSummaryItem(
                          icon: Icons.local_parking,
                          label: 'Vignette',
                          date: car.rovignetteExpiry,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editDocumentDate(String docType, DateTime currentDate) {
    showDialog(
      context: context,
      builder: (context) => EditDocumentDialog(
        car: car,
        docType: docType,
        currentDate: currentDate,
        onSave: (updatedCar) {
          setState(() {
            car = updatedCar;
          });
        },
      ),
    );
  }
}
