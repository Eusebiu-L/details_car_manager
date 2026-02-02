import '../../models/car.dart';

/// Utility class for updating car document expiry dates.
/// 
/// Creates updated Car instances with modified document expiry dates while
/// preserving all other car data.
class CarUpdater {
  /// Updates a specific document's expiry date for a car.
  /// 
  /// Returns a new Car instance with the updated expiry date for the specified
  /// document type (Insurance, ITP, or Vignette), preserving all other data.
  static Car updateDocumentExpiry({
    required Car car,
    required String docType,
    required DateTime expiryDate,
  }) {
    return switch (docType) {
      'Insurance' => Car(
          id: car.id,
          name: car.name,
          insuranceExpiry: expiryDate,
          itpExpiry: car.itpExpiry,
          rovignetteExpiry: car.rovignetteExpiry,
        ),
      'ITP' => Car(
          id: car.id,
          name: car.name,
          insuranceExpiry: car.insuranceExpiry,
          itpExpiry: expiryDate,
          rovignetteExpiry: car.rovignetteExpiry,
        ),
      _ => Car(
          id: car.id,
          name: car.name,
          insuranceExpiry: car.insuranceExpiry,
          itpExpiry: car.itpExpiry,
          rovignetteExpiry: expiryDate,
        ),
    };
  }
}
