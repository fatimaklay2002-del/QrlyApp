import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

Future<void> showScanResultDialog(BuildContext context, String value) async {
  await showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('تم المسح بنجاح'),
      content: SingleChildScrollView(child: SelectableText(value)),
      actions: [
        TextButton.icon(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: value));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم النسخ')),
            );
          },
          icon: const Icon(Icons.copy),
          label: const Text('نسخ'),
        ),
        TextButton.icon(
          onPressed: () => Share.share(value),
          icon: const Icon(Icons.share),
          label: const Text('مشاركة'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('تم'),
        ),
      ],
    ),
  );
}