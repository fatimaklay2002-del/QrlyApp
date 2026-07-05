import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/app_strings.dart';
import 'glass_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  final MobileScannerController controller;
  const CustomAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('assets/images/logo.png', width: 36, height: 36),
            const SizedBox(width: 16),
            Text(AppStrings.appName, style: AppTextStyles.inter700Size20),
          ],
        ),
        Row(
          children: [
            GlassIconButton(
              iconPath: 'assets/images/flash_icon.svg',
              onTap: () {
                controller.toggleTorch();
              },
            ),
            const SizedBox(width: 16),
            GlassIconButton(
              iconPath: 'assets/images/camera_icon.svg',
              onTap: () {
                controller.switchCamera();
              },
            ),
          ],
        ),
      ],
    );
  }
}
