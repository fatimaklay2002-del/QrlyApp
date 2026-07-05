import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/history_repository.dart';
import '../../../core/models/scan_history_model.dart';
import 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepository _repository;
 
  HistoryCubit(this._repository) : super(const HistoryState()) {
    _loadItems();
  }
 
  void _loadItems() {
    emit(state.copyWith(items: _repository.getAll()));
  }
 
  Future<void> addItem(QrHistoryItem item) async {
    await _repository.addItem(item);
    _loadItems();
  }
 
  Future<void> deleteItem(String id) async {
    await _repository.deleteItem(id);
    _loadItems();
  }
 
  void changeFilter(HistoryFilter filter) {
    emit(state.copyWith(filter: filter));
  }
}
 