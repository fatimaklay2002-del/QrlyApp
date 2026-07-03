import 'package:flutter/material.dart';
import 'package:qrly_app/core/utils/app_color.dart';

import '../../../../core/theme/app_text_style.dart' show AppTextStyles;

class RecentScansButton extends StatelessWidget {
  const RecentScansButton();
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: فتح آخر السجل (Recent Scans)
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.history, size: 18, color: AppColor.secondary),
            const SizedBox(width: 8),
            Text(
              'View Recent Scans',
              style: AppTextStyles.inter600Size14.copyWith(
                color: AppColor.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}