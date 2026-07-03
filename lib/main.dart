import 'package:flutter/material.dart';
import 'package:qrly_app/core/utils/app_color.dart';
import 'package:qrly_app/core/utils/app_strings.dart';
import 'package:qrly_app/features/scan_qr_code/presentation/widgets/nav_bar.dart';

void main() {
  runApp(const QrlyApp());
}


class QrlyApp extends StatelessWidget {
  const QrlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.background,
      ),
      title: AppStrings.appName,
      home: NavBar()
    
    );
  }
}