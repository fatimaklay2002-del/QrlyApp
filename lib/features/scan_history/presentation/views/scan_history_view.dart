import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qrly_app/core/data/history_repository.dart';

import 'package:qrly_app/core/widgets/section_header_widget.dart';
import 'package:qrly_app/core/models/scan_history_model.dart';
import 'package:qrly_app/features/scan_history/presentation/widgets/custom_filter_tabs.dart';

class ScanHistoryView extends StatefulWidget {
  const ScanHistoryView({super.key});
  static final List<QrHistoryItem> _items = [
    QrHistoryItem(
      id: '1',
      content: 'https://www.google.com/search?q=qrly+scanner',
      type: HistoryItemType.scanned,
      timestamp: DateTime(2023, 10, 23, 10, 30),
    ),
    QrHistoryItem(
      id: '2',
      content: 'WiFi Guest Credentials: Home_2G',
      type: HistoryItemType.generated,
      timestamp: DateTime(2023, 10, 23, 11, 15),
    ),
    QrHistoryItem(
      id: '3',
      content: 'vCard: Jordan Smith (Design Lead)',
      type: HistoryItemType.scanned,
      timestamp: DateTime(2023, 10, 22, 16, 20),
    ),
    QrHistoryItem(
      id: '4',
      content: 'https://qrly.app/download-pro',
      type: HistoryItemType.generated,
      timestamp: DateTime(2023, 10, 23, 11, 5),
    ),
    QrHistoryItem(
      id: '5',
      content: 'Location: 40.7128° N, 74.0060° W',
      type: HistoryItemType.scanned,
      timestamp: DateTime(2023, 10, 23, 10, 30),
    ),
  ];

  @override
  State<ScanHistoryView> createState() => _ScanHistoryViewState();
}

class _ScanHistoryViewState extends State<ScanHistoryView> {
  final repo = HistoryRepository();
  initState() {
    super.initState();
    _testHive();
  }

  Future<void> _testHive() async {
    await repo.addItem(
      QrHistoryItem(
        id: '1',
        content: 'Test item',
        type: HistoryItemType.scanned,
        timestamp: DateTime.now(),
      ),
    );
    print(repo.getAll());
  }

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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
