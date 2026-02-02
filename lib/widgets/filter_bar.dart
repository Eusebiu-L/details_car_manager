import 'package:flutter/material.dart';
import '../common/app_colors.dart';
import '../common/app_strings.dart';

/// Enum for available filter types in the application.
enum FilterType {
  all,
  expiredVignette,
  expiredItp,
  expiredInsurance,
}

/// Filter bar widget allowing users to filter cars by document expiry status.
/// 
/// Displays filter options as chips that users can tap to filter the car list.
class FilterBar extends StatelessWidget {
  /// Currently selected filter type
  final FilterType selectedFilter;
  
  /// Callback when filter selection changes
  final Function(FilterType) onFilterChanged;

  const FilterBar({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        children: [
          _FilterChip(
            label: AppStrings.filterAll,
            isSelected: selectedFilter == FilterType.all,
            onTap: () => onFilterChanged(FilterType.all),
          ),
          const SizedBox(height: 8),
          _FilterChip(
            label: AppStrings.filterExpiredVignette,
            isSelected: selectedFilter == FilterType.expiredVignette,
            onTap: () => onFilterChanged(FilterType.expiredVignette),
          ),
          const SizedBox(height: 8),
          _FilterChip(
            label: AppStrings.filterExpiredItp,
            isSelected: selectedFilter == FilterType.expiredItp,
            onTap: () => onFilterChanged(FilterType.expiredItp),
          ),
          const SizedBox(height: 8),
          _FilterChip(
            label: AppStrings.filterExpiredInsurance,
            isSelected: selectedFilter == FilterType.expiredInsurance,
            onTap: () => onFilterChanged(FilterType.expiredInsurance),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  /// Label text displayed on the chip
  final String label;
  
  /// Whether this filter chip is currently selected
  final bool isSelected;
  
  /// Callback when the chip is tapped
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryPurple
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryPurple
                : Colors.grey[400]!,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.white : Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
