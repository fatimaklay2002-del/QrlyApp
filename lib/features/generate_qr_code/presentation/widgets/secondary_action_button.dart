import 'package:flutter/material.dart';
import 'package:qrly_app/core/theme/app_text_style.dart';
import 'package:qrly_app/core/utils/app_color.dart';

class SecondaryActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;
 
  const SecondaryActionButton({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColor.border,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColor.secondary, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
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