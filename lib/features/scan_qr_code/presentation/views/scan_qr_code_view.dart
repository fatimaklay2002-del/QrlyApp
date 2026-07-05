import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/theme/app_text_style.dart';
import '../../logic/scan_cubit.dart';
import '../../logic/scan_state.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/scan_overlay.dart';
import '../widgets/scan_result_dialog.dart';
import '../widgets/scanner_frame_widget.dart';

class ScanQrCodeView extends StatefulWidget {
  const ScanQrCodeView({super.key});

  @override
  State<ScanQrCodeView> createState() => _ScanQrCodeViewState();
}

class _ScanQrCodeViewState extends State<ScanQrCodeView> {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );
  DateTime? _ignoreDetectionsUntil;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    final value =
    capture.barcodes.isNotEmpty ? capture.barcodes.first.rawValue : null;
    if (value == null || value.isEmpty) return;
    if (context.read<ScanCubit>().state.isProcessing) return;

    // لسه في فترة التهدئة بعد آخر مسحة؟ تجاهلي أي اكتشاف
    final now = DateTime.now();
    if (_ignoreDetectionsUntil != null && now.isBefore(_ignoreDetectionsUntil!)) {
      return;
    }

    await _controller.stop();
    await context.read<ScanCubit>().handleDetected(value);
    if (mounted) await showScanResultDialog(context, value);

    // العدّ بيبدأ دلوقتي بعد ما الديالوج اتقفل، مش من وقت الاكتشاف
    _ignoreDetectionsUntil = DateTime.now().add(const Duration(seconds: 3));
    await _controller.start();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<ScanCubit, ScanState>(
        builder: (context, state) => Stack(
          children: [
            Positioned.fill(
              child: MobileScanner(
                controller: _controller,
                onDetect: _onDetect,
              ),
            ),
            const ScanOverlay(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    CustomAppBar(controller: _controller),
                    const Spacer(),
                    Text(
                      'Align QR code within the frame',
                      style: AppTextStyles.inter600Size14OnDark,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const ScannerFrame(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            if (state.isProcessing)
              Positioned.fill(
                child: Container(
                  color: Colors.black45,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
