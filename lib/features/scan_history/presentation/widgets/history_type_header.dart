import 'package:qrly_app/core/theme/app_text_style.dart';
import 'package:qrly_app/core/utils/app_color.dart';
import 'package:flutter/widgets.dart';

class HistoryTypeHeader extends StatelessWidget {
  final String label;

  const HistoryTypeHeader({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 8),
      child: Text(
        label,
        style: AppTextStyles.inter700Size20.copyWith(
          fontSize: 15,
          color: AppColor.secondary,
        ),
      ),
    );
  }
}
