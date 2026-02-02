import 'package:flutter/material.dart';
import '../models/car.dart';
import '../services/car_service.dart';
import '../widgets/cars_list_view.dart';
import '../widgets/sections/expiring_warning_section.dart';
import '../widgets/filter_bar.dart';
import '../constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Car> cars;
  FilterType selectedFilter = FilterType.all;
  bool showFilters = false;

  @override
  void initState() {
    super.initState();
    cars = CarService.getInitialCars();
  }

  int get carsWithExpiredDocs => CarService.getExpiredDocsCount(cars);

  List<MapEntry<Car, String>> get docsExpiringIn7Days =>
      CarService.getDocsExpiringIn7Days(cars);

  List<Car> get filteredCars {
    switch (selectedFilter) {
      case FilterType.expiredVignette:
        return CarService.getExpiredRovignetteCars(cars);
      case FilterType.expiredItp:
        return CarService.getExpiredItpCars(cars);
      case FilterType.expiredInsurance:
        return CarService.getExpiredInsuranceCars(cars);
      default:
        return cars;
    }
  }

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  showFilters = !showFilters;
                });
              },
              icon: Icon(showFilters ? Icons.expand_less : Icons.expand_more),
              label: Text(showFilters ? 'Hide Filters' : 'Show Filters'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ),
          if (showFilters)
            FilterBar(
              selectedFilter: selectedFilter,
              onFilterChanged: (newFilter) {
                setState(() {
                  selectedFilter = newFilter;
                });
              },
            ),
          ExpiringWarningSection(expiringDocs: docsExpiringIn7Days),
          Expanded(
            child: CarsListView(
              cars: filteredCars,
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
                  hintText: 'e.g., Toyota',
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
