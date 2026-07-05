import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoryEmptyState extends StatelessWidget {
  const HistoryEmptyState({super.key});
 
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 60),
      child: Center(
        child: Text(
          'No items yet.\nScan or generate a QR code to see it here.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
 