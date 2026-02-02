/// Model representing a car and its document expiry information.
/// 
/// Contains the car's basic information (id, name, image) and three important
/// document expiry dates: insurance, technical inspection (ITP), and road vignette.
class Car {
  /// Unique identifier for the car
  final String id;
  
  /// Car's name/model (e.g., 'Toyota Corolla')
  final String name;
  
  /// Path to the car's image asset
  final String imagePath;
  
  /// Car insurance expiry date
  final DateTime insuranceExpiry;
  
  /// Technical Inspection (ITP) expiry date
  final DateTime itpExpiry;
  
  /// Road Vignette (Rovignetă) expiry date
  final DateTime rovignetteExpiry;

  Car({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.insuranceExpiry,
    required this.itpExpiry,
    required this.rovignetteExpiry,
  });
}
