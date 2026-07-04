import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qrly_app/core/utils/app_color.dart';
import 'package:qrly_app/core/utils/app_strings.dart';
import 'package:qrly_app/features/generate_qr_code/presentation/widgets/secondary_action_button.dart';
import 'package:qrly_app/features/generate_qr_code/presentation/widgets/url_input_field.dart';

import '../../../../core/widgets/section_header_widget.dart';
import '../widgets/primary_action_button.dart';
import '../widgets/qr_preview_card_widget.dart';

class GenerateQrCodeView extends StatefulWidget {
  const GenerateQrCodeView({super.key});

  @override
  State<GenerateQrCodeView> createState() => _GenerateQrCodeViewState();
}

class _GenerateQrCodeViewState extends State<GenerateQrCodeView> {
   final TextEditingController _controller = TextEditingController();
  String _currentText = '';
 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final bool hasContent = _currentText.trim().isNotEmpty;
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               SectionHeader(
                leadingIcon: SvgPicture.asset('assets/images/scan_icon_active.svg', width: 24, height: 24),
                title: AppStrings.generate,
              ),
              const SizedBox(height: 24),
              UrlInputField(
                controller: _controller,
                onChanged: (value) => setState(() => _currentText = value),
              ),
              const SizedBox(height: 20),
              QrPreviewCard(data: _currentText),
              const SizedBox(height: 24),
              PrimaryActionButton(
                label: AppStrings.saveToGallery,
                icon: Icons.save_alt_outlined,
                onTap: hasContent
                    ? () {
                      }
                    : null,
              ),
              const SizedBox(height: 12),
              SecondaryActionButton(
                label: AppStrings.share,
                icon: Icons.share_outlined,
                onTap: hasContent
                    ? () {
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 