import 'package:flutter/material.dart';

import '../theme/app_text_style.dart';

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
