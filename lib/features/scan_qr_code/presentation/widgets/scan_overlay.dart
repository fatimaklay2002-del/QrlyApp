 
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScanOverlay extends StatelessWidget {
  const ScanOverlay({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
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
    );
  }
}