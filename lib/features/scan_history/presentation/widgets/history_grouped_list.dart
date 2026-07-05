import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/scan_history_model.dart';
import '../../../../core/utils/date_time_helper.dart';
import '../../logic/history_cubit.dart';
import 'date_section_label.dart';
import 'history_list_item.dart';

List<Widget> buildGroupedHistoryItems(
  BuildContext context,
  List<QrHistoryItem> items,
) {
  final widgets = <Widget>[];
  String? lastGroup;

  for (final item in items) {
    final group = dateGroupLabel(item.timestamp);
    if (group != lastGroup) {
      if (group != null) widgets.add(DateSectionLabel(label: group));
      lastGroup = group;
    }
    widgets.add(
      Dismissible(
        key: ValueKey(item.id),
        direction: DismissDirection.endToStart,
        onDismissed: (_) => context.read<HistoryCubit>().deleteItem(item.id),
        background: _buildDeleteBackground(),
        child: HistoryListItem(item: item),
      ),
    );
  }
  return widgets;
}

Widget _buildDeleteBackground() {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    alignment: Alignment.centerRight,
    decoration: BoxDecoration(
      color: Colors.redAccent,
      borderRadius: BorderRadius.circular(16),
    ),
    child: const Icon(Icons.delete_outline, color: Colors.white),
  );
}
