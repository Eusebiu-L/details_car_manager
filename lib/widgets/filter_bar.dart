import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';

enum FilterType {
  all,
  expiredVignette,
  expiredItp,
  expiredInsurance,
}

class FilterBar extends StatelessWidget {
  final FilterType selectedFilter;
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
  final String label;
  final bool isSelected;
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
