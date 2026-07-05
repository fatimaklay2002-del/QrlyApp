import 'package:Qrly/features/scan_qr_code/presentation/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_style.dart' show AppTextStyles;
import '../../../../core/utils/app_color.dart';

class RecentScansButton extends StatelessWidget {
  const RecentScansButton({super.key});
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavBar.controller.jumpToTab(2);
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