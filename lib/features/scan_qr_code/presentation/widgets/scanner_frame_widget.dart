import 'package:flutter/material.dart';
import 'package:qrly_app/core/utils/app_color.dart';
import 'package:qrly_app/features/scan_qr_code/presentation/widgets/corner_frame_painter.dart';

class ScannerFrame extends StatelessWidget {
  const ScannerFrame();
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: CustomPaint(
        painter: CornerFramePainter(color: AppColor.primary),
      ),
    );
  }
}