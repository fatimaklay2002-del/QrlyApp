import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/app_color.dart';

class QrPreviewCard extends StatelessWidget {
  final String data;

  const QrPreviewCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final bool hasContent = data.trim().isNotEmpty;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.border),
      ),
      child: Column(
        children: [
          Container(
            width: 180,
            height: 180,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: hasContent ? AppColor.white : AppColor.altBackground,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColor.divider),
            ),
            child: hasContent
                ? QrImageView(
                    data: data,
                    version: QrVersions.auto,
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: AppColor.secondary,
                    ),
                    dataModuleStyle: const QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.square,
                      color: AppColor.primary,
                    ),
                  )
                : Icon(Icons.qr_code_2, size: 64, color: AppColor.divider),
          ),
          const SizedBox(height: 16),
          Text(
            hasContent
                ? 'Scan to preview current result'
                : 'Enter a link or text to generate a code',
            style: AppTextStyles.inter400Size14,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
