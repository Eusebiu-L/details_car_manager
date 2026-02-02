import 'package:flutter/material.dart';

/// Central color palette for the application.
/// 
/// Defines all colors used throughout the app for consistency,
/// including primary colors, status colors (valid, expired, warning), and neutral colors.
class AppColors {
  // Primary colors
  /// Main purple color for app branding
  static Color get primaryPurple => Colors.purple[700]!;
  
  /// Light purple for backgrounds
  static Color get lightPurple => Colors.purple[50]!;

  // Status colors
  /// Green color indicating valid/ok status
  static Color get validGreen => Colors.green;
  
  /// Light green background for valid items
  static Color get validGreenBackground => Colors.green[100]!;
  
  /// Red color indicating expired status
  static Color get expiredRed => Colors.red;
  
  /// Light red background for expired items
  static Color get expiredRedBackground => Colors.red[100]!;
  
  /// Yellow/orange color for warning status
  static Color get warningYellow => Colors.yellow[600]!;
  
  /// Light yellow background for warning items
  static Color get warningYellowBackground => Colors.yellow[100]!;

  // Neutral colors
  /// White color for backgrounds
  static Color get white => Colors.white;
  
  /// Black color for text
  static Color get black => Colors.black;
  
  /// Dark grey for secondary text
  static Color get greyText => Colors.grey[700]!;
  
  /// Light grey for borders
  static Color get greyBorder => Colors.grey[300]!;
}
