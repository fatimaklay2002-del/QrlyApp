import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qrly_app/core/widgets/section_header_widget.dart';
import 'package:qrly_app/features/scan_history/presentation/widgets/custom_filter_tabs.dart';

class ScanHistoryView extends StatelessWidget {
  const ScanHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(
              leadingIcon: SvgPicture.asset(
                'assets/images/history_icon_active.svg',
                width: 24,
                height: 24,
              ),
              title: 'Scan History',
            ),
            const SizedBox(height: 32),
            CustomFilterTabs(
              onTabSelected: (index) {
                print("Selected index: $index");
              },
            ),
          ],
        ),
      ),
    );
  }
}
