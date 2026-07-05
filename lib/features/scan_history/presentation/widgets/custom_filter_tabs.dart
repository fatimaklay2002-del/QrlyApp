import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';

class CustomFilterTabs extends StatefulWidget {
  final Function(int) onTabSelected;

  const CustomFilterTabs({super.key, required this.onTabSelected});

  @override
  State<CustomFilterTabs> createState() => _CustomFilterTabsState();
}

class _CustomFilterTabsState extends State<CustomFilterTabs> {
  int _selectedIndex = 0;
  final List<String> _tabs = ['All', AppStrings.scanned, AppStrings.generated];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_tabs.length, (index) {
        bool isSelected = _selectedIndex == index;
        return Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap: () {
              setState(() => _selectedIndex = index);
              widget.onTabSelected(index);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColor.primary : AppColor.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? AppColor.primary : AppColor.chipBorder,
                ),
              ),
              child: Text(_tabs[index], style: AppTextStyles.inter600Size12),
            ),
          ),
        );
      }),
    );
  }
}
