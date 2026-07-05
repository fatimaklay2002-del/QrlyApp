import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import 'corner_frame_painter.dart';

class ScannerFrame extends StatelessWidget {
  const ScannerFrame({super.key});
 
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