import '../models/car.dart';

class CarService {
  static List<Car> getInitialCars() {
    return [
      Car(
        id: '1',
        name: 'Toyota Corolla',
        imagePath: 'assets/images/car1.png',
        insuranceExpiry: DateTime.now().add(const Duration(days: 45)),
        itpExpiry: DateTime.now().subtract(const Duration(days: 5)),
        rovignetteExpiry: DateTime.now().add(const Duration(days: 45)),
      ),
      Car(
        id: '2',
        name: 'BMW X5',
        imagePath: 'assets/images/car2.png',
        insuranceExpiry: DateTime.now().add(const Duration(days: 7)),
        itpExpiry: DateTime.now().add(const Duration(days: 300)),
        rovignetteExpiry: DateTime.now().add(const Duration(days: 150)),
      ),
      Car(
        id: '3',
        name: 'Audi A4',
        imagePath: 'assets/images/car3.png',
        insuranceExpiry: DateTime.now().add(const Duration(days: 45)),
        itpExpiry: DateTime.now().add(const Duration(days: 60)),
        rovignetteExpiry: DateTime.now().add(const Duration(days: 90)),
      ),
      Car(
        id: '4',
        name: 'Volkswagen Golf',
        imagePath: 'assets/images/car4.png',
        insuranceExpiry: DateTime.now().add(const Duration(days: 80)),
        itpExpiry: DateTime.now().add(const Duration(days: 60)),
        rovignetteExpiry: DateTime.now().add(const Duration(days: 200)),
      ),
      Car(
        id: '5',
        name: 'Land Rover Freelander',
        imagePath: 'assets/images/car5.png',
        insuranceExpiry: DateTime.now().subtract(const Duration(days: 10)),
        itpExpiry: DateTime.now().add(const Duration(days: 120)),
        rovignetteExpiry: DateTime.now().add(const Duration(days: 90)),
      ),
      Car(
        id: '6',
        name: 'BMW M6',
        imagePath: 'assets/images/car6.png',
        insuranceExpiry: DateTime.now().add(const Duration(days: 200)),
        itpExpiry: DateTime.now().add(const Duration(days: 150)),
        rovignetteExpiry: DateTime.now().subtract(const Duration(days: 30)),
      ),
      Car(
        id: '7',
        name: 'Nissan Patrol Y61',
        imagePath: 'assets/images/car7.png',
        insuranceExpiry: DateTime.now().add(const Duration(days: 250)),
        itpExpiry: DateTime.now().subtract(const Duration(days: 15)),
        rovignetteExpiry: DateTime.now().add(const Duration(days: 180)),
      ),
    ];
  }

  static int getExpiredDocsCount(List<Car> cars) {
    return cars.where((car) {
      final now = DateTime.now();
      return car.insuranceExpiry.isBefore(now) ||
          car.itpExpiry.isBefore(now) ||
          car.rovignetteExpiry.isBefore(now);
    }).length;
  }

  static List<MapEntry<Car, String>> getDocsExpiringIn7Days(List<Car> cars) {
    final now = DateTime.now();
    final in7Days = now.add(const Duration(days: 7));
    final expiringDocs = <MapEntry<Car, String>>[];

    for (var car in cars) {
      if (car.insuranceExpiry.isAfter(now) &&
          car.insuranceExpiry.isBefore(in7Days)) {
        expiringDocs.add(MapEntry(car, 'Insurance'));
      }
      if (car.itpExpiry.isAfter(now) &&
          car.itpExpiry.isBefore(in7Days)) {
        expiringDocs.add(MapEntry(car, 'ITP'));
      }
      if (car.rovignetteExpiry.isAfter(now) &&
          car.rovignetteExpiry.isBefore(in7Days)) {
        expiringDocs.add(MapEntry(car, 'Vignette'));
      }
    }
    return expiringDocs;
  }

  static bool hasExpiredDocs(Car car) {
    final now = DateTime.now();
    return car.insuranceExpiry.isBefore(now) ||
        car.itpExpiry.isBefore(now) ||
        car.rovignetteExpiry.isBefore(now);
  }

  static List<Car> getExpiredRovignetteCars(List<Car> cars) {
    final now = DateTime.now();
    return cars.where((car) => car.rovignetteExpiry.isBefore(now)).toList();
  }

  static List<Car> getExpiredItpCars(List<Car> cars) {
    final now = DateTime.now();
    return cars.where((car) => car.itpExpiry.isBefore(now)).toList();
  }

  static List<Car> getExpiredInsuranceCars(List<Car> cars) {
    final now = DateTime.now();
    return cars.where((car) => car.insuranceExpiry.isBefore(now)).toList();
  }

  static List<Car> getAnyExpiredDocsCars(List<Car> cars) {
    return cars.where((car) => hasExpiredDocs(car)).toList();
  }
}
