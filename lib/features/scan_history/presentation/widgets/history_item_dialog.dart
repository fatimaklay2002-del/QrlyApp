 
import 'package:Qrly/core/models/scan_history_model.dart';
import 'package:Qrly/features/scan_history/logic/history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

Future<void> showHistoryItemDialog(
  BuildContext context,
  QrHistoryItem item,
) async {
  await showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Item Details'),
      content: SingleChildScrollView(child: SelectableText(item.content)),
      actions: [
        TextButton.icon(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: item.content));
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
          },
          icon: const Icon(Icons.copy),
          label: const Text('Copy'),
        ),
        TextButton.icon(
          onPressed: () => Share.share(item.content),
          icon: const Icon(Icons.share),
          label: const Text('Share'),
        ),
        TextButton.icon(
          onPressed: () {
            context.read<HistoryCubit>().deleteItem(item.id);
            Navigator.of(ctx).pop();
          },
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          label: const Text('Delete', style: TextStyle(color: Colors.red)),
        ),
        FilledButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}