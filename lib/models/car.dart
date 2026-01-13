class Car {
  final String id;
  final String name;
  final String imagePath;
  final DateTime insuranceExpiry;
  final DateTime itpExpiry;
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
