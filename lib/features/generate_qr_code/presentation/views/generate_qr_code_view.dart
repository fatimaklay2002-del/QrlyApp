import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/services/qr_image_service.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/section_header_widget.dart';
import '../../logic/generate_cubit.dart';
import '../../logic/generate_state.dart';
import '../widgets/primary_action_button.dart';
import '../widgets/qr_preview_card_widget.dart';
import '../widgets/secondary_action_button.dart';
import '../widgets/url_input_field.dart';

class GenerateQrCodeView extends StatefulWidget {
  const GenerateQrCodeView({super.key});

  @override
  State<GenerateQrCodeView> createState() => _GenerateQrCodeViewState();
}

class _GenerateQrCodeViewState extends State<GenerateQrCodeView> {
  final GlobalKey _qrKey = GlobalKey();
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: BlocConsumer<GenerateCubit, GenerateState>(
          listener: (context, state) {
            if (state.saved && !state.isSaving) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Saved to history and gallery')),
              );
            }
          },
          builder: (context, state) {
      
           return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionHeader(
                  title: AppStrings.generate,
                  leadingIcon: SvgPicture.asset(
                    'assets/icons/generate_icon.svg',
                  ),
                ),
                const SizedBox(height: 24),
                UrlInputField(
                  controller: _textController,
                  onChanged: context.read<GenerateCubit>().updateText,
                ),
                const SizedBox(height: 20),
                RepaintBoundary(
                  key: _qrKey,
                  child: QrPreviewCard(data: state.text),
                ),
                const SizedBox(height: 24),
                PrimaryActionButton(
                  label: state.isSaving
                      ? 'Saving...'
                      : (state.saved ? 'Saved' : 'Save to Gallery'),
                  icon: state.saved ? Icons.check : Icons.save_alt_outlined,
                  onTap: state.hasContent && !state.saved && !state.isSaving
                      ? () async {
                          final bytes = await QrImageService.captureBytes(
                            _qrKey,
                          );
                          if (!context.mounted) return;
                          context.read<GenerateCubit>().saveToHistory(bytes);
                        }
                      : null,
                ),
                const SizedBox(height: 12),
                SecondaryActionButton(
                  label: 'Share',
                  icon: Icons.share_outlined,
                  onTap: state.hasContent
                      ? () => QrImageService.shareQr(_qrKey, state.text)
                      : null,
                ),
              ],
            ),
          );
        }
        ),
      ),
    );
  }
}
