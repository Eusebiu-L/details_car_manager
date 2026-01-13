import '../../models/car.dart';

class CarUpdater {
  static Car updateDocumentExpiry({
    required Car car,
    required String docType,
    required DateTime expiryDate,
  }) {
    return switch (docType) {
      'Insurance' => Car(
          id: car.id,
          name: car.name,
          imagePath: car.imagePath,
          insuranceExpiry: expiryDate,
          itpExpiry: car.itpExpiry,
          rovignetteExpiry: car.rovignetteExpiry,
        ),
      'ITP' => Car(
          id: car.id,
          name: car.name,
          imagePath: car.imagePath,
          insuranceExpiry: car.insuranceExpiry,
          itpExpiry: expiryDate,
          rovignetteExpiry: car.rovignetteExpiry,
        ),
      _ => Car(
          id: car.id,
          name: car.name,
          imagePath: car.imagePath,
          insuranceExpiry: car.insuranceExpiry,
          itpExpiry: car.itpExpiry,
          rovignetteExpiry: expiryDate,
        ),
    };
  }
}
