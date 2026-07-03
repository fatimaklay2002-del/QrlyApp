import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qrly_app/core/theme/app_text_style.dart';
import 'package:qrly_app/core/utils/app_color.dart';
import 'package:qrly_app/core/utils/app_strings.dart';
import 'package:qrly_app/features/scan_qr_code/presentation/widgets/glass_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

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
        Row(children: [
            GlassIconButton(
              iconPath: 'assets/images/flash_icon.svg',
              onTap: () {
              },),
             const SizedBox(width: 16),
            GlassIconButton(
              iconPath: 'assets/images/camera_icon.svg',
              onTap: () {
              },),
              
             ],)
      
      ],

    );
  }
}