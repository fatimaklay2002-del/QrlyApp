import 'package:flutter/material.dart';
import 'package:qrly_app/core/theme/app_text_style.dart';
import 'package:qrly_app/core/utils/app_color.dart';

class DateSectionLabel extends StatelessWidget {
  final String label;

  const DateSectionLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 4),
      child: Text(
        label.toUpperCase(),
        style: AppTextStyles.inter600Size12.copyWith(
          color: AppColor.mutedText,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}