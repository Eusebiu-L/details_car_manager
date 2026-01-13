import 'package:flutter/material.dart';
import '../models/car.dart';
import '../services/car_service.dart';
import '../widgets/cars_list_view.dart';
import '../widgets/sections/expiring_warning_section.dart';
import '../constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Car> cars;

  @override
  void initState() {
    super.initState();
    cars = CarService.getInitialCars();
  }

  int get carsWithExpiredDocs => CarService.getExpiredDocsCount(cars);

  List<MapEntry<Car, String>> get docsExpiringIn7Days =>
      CarService.getDocsExpiringIn7Days(cars);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Reminder App'),
        elevation: 0,
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ExpiringWarningSection(expiringDocs: docsExpiringIn7Days),
          Expanded(
            child: CarsListView(
              cars: cars,
              onCarUpdated: (updatedCar) {
                setState(() {
                  final index = cars.indexWhere((c) => c.id == updatedCar.id);
                  if (index != -1) {
                    cars[index] = updatedCar;
                  }
                });
              },
              onCarDeleted: (carToDelete) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Delete Car'),
                    content: Text(
                      'Are you sure you want to delete "${carToDelete.name}"?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            cars.removeWhere((c) => c.id == carToDelete.id);
                          });
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${carToDelete.name} deleted'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        child: const Text('Delete', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCarDialog,
        backgroundColor: Colors.yellow[600],
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddCarDialog() {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Car'),
        content: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Car Name',
                  hintText: 'e.g., Toyota Corolla',
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
              if (nameController.text.isNotEmpty) {
                final newCar = Car(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: nameController.text,
                  imagePath: 'assets/images/car1.png',
                  insuranceExpiry: DateTime.now().add(const Duration(days: 365)),
                  itpExpiry: DateTime.now().add(const Duration(days: 365)),
                  rovignetteExpiry: DateTime.now().add(const Duration(days: 365)),
                );
                setState(() {
                  cars.add(newCar);
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
