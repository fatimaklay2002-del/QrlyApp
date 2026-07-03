import 'package:flutter/material.dart';
import 'package:qrly_app/core/theme/app_text_style.dart';
import 'package:qrly_app/core/utils/app_color.dart';

class SectionHeader extends StatelessWidget {
  final Widget leadingIcon;
  final String title;
 
  const SectionHeader({
    super.key,
    required this.leadingIcon,
    required this.title,
  
  });
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            leadingIcon,
            const SizedBox(width: 10),
            Text(title, style: AppTextStyles.inter700Size20),
          ],
        ),
        
      ],
    );
  }
}