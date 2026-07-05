import '../../../core/models/scan_history_model.dart';

enum HistoryFilter { all, scanned, generated }

class HistoryState {
  final List<QrHistoryItem> items;
  final HistoryFilter filter;

  const HistoryState({this.items = const [], this.filter = HistoryFilter.all});

  List<QrHistoryItem> get filteredItems {
    switch (filter) {
      case HistoryFilter.scanned:
        return items.where((i) => i.type == HistoryItemType.scanned).toList();
      case HistoryFilter.generated:
        return items.where((i) => i.type == HistoryItemType.generated).toList();
      case HistoryFilter.all:
        return items;
    }
  }

  HistoryState copyWith({List<QrHistoryItem>? items, HistoryFilter? filter}) {
    return HistoryState(
      items: items ?? this.items,
      filter: filter ?? this.filter,
    );
  }
}
