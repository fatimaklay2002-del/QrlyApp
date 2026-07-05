// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:qrly_app/core/models/scan_history_model.dart';
import 'package:qrly_app/main.dart';

void main() {
  setUp( () async {
    // بيفتح Hive وهمي (في الذاكرة فقط) خاص بكل اختبار
    await setUpTestHive();
    Hive.registerAdapter(QrHistoryItemAdapter());
    Hive.registerAdapter(HistoryItemTypeAdapter());
    await Hive.openBox<QrHistoryItem>('qr_history_box');
  });

  tearDown(() async {
    await tearDownTestHive();
  });

  testWidgets('App builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const AppProviders());
    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}