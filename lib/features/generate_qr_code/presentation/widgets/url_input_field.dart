import 'package:flutter/material.dart';
import 'package:qrly_app/core/theme/app_text_style.dart';
import 'package:qrly_app/core/utils/app_color.dart';

class UrlInputField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
 
  const UrlInputField({
    super.key,
    required this.controller,
    this.onChanged,
  });
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('URL OR CONTENT', style: AppTextStyles.inter600Size11Label),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColor.altBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.divider),
          ),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: AppTextStyles.inter400Size14.copyWith(
              color: AppColor.primaryText,
            ),
            decoration: InputDecoration(
              hintText: 'https://yourlink.com',
              hintStyle: AppTextStyles.inter400Size14,
              prefixIcon: Icon(
                Icons.link,
                color: AppColor.mutedText,
                size: 20,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
      ],
    );
  }
}
 