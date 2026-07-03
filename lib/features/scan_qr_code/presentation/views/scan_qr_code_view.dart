import 'package:flutter/material.dart';
import 'package:qrly_app/core/theme/app_text_style.dart';
import 'package:qrly_app/features/scan_qr_code/presentation/widgets/custom_app_bar.dart';
import 'package:qrly_app/features/scan_qr_code/presentation/widgets/scanner_frame_widget.dart';

import '../widgets/recent_scans_button_widget.dart';

class ScanQrCodeView extends StatelessWidget {
  const ScanQrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
           Positioned.fill(
            child: Container(color: Colors.black),
          ),
           Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.45),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.55),
                  ],
                  stops: const [0.0, 0.25, 0.7, 1.0],
                ),
              ),
            ),
          ),
            SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const CustomAppBar(),
                  const Spacer(),
                  Text(
                    'Align QR code within the frame',
                    style: AppTextStyles.inter600Size14OnDark,
                    textAlign: TextAlign.center,
                  ),
                   const SizedBox(height: 20),
                  const ScannerFrame(),
               const Spacer(),
                  const RecentScansButton(),
                   const SizedBox(height: 24),
               ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}