import 'package:flutter/material.dart';
import '../models/car.dart';
import '../services/car_service.dart';
import '../screens/car_details_screen.dart';
import '../constants/app_colors.dart';

class CarsListView extends StatelessWidget {
  final List<Car> cars;
  final Function(Car) onCarUpdated;
  final Function(Car) onCarDeleted;

  const CarsListView({
    super.key,
    required this.cars,
    required this.onCarUpdated,
    required this.onCarDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: cars.length,
      itemBuilder: (context, index) {
        final car = cars[index];
        final hasExpiredDocs = CarService.hasExpiredDocs(car);

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CarDetailsScreen(car: car),
              ),
            ).then((updatedCar) {
              if (updatedCar != null) {
                onCarUpdated(updatedCar);
              }
            });
          },
          child: Card(
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'ID: ${car.id}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: hasExpiredDocs
                          ? AppColors.expiredRedBackground
                          : AppColors.validGreenBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      hasExpiredDocs
                          ? Icons.error_outline
                          : Icons.check_circle_outline,
                      color: hasExpiredDocs ? AppColors.expiredRed : AppColors.validGreen,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      onCarDeleted(car);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
