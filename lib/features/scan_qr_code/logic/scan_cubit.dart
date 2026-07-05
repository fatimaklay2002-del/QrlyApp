import 'package:qrly_app/features/scan_qr_code/logic/scan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/scan_history_model.dart';
import '../../scan_history/logic/history_cubit.dart';

class ScanCubit extends Cubit<ScanState> {
  final HistoryCubit historyCubit;

  ScanCubit(this.historyCubit) : super(const ScanState());

  bool shouldProcess(String? value) {
    if (value == null || value.isEmpty) return false;
    if (state.isProcessing || state.isDialogOpen) return false;

    final until = state.ignoreDetectionsUntil;
    if (until != null && DateTime.now().isBefore(until)) return false;

    return true;
  }

  Future<void> handleDetected(String value) async {
    emit(state.copyWith(isProcessing: true, isDialogOpen: true));

    final item = QrHistoryItem(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      content: value,
      type: HistoryItemType.scanned,
      timestamp: DateTime.now(),
    );
    await historyCubit.addItem(item);

    emit(state.copyWith(isProcessing: false));
  }

  void onDialogClosed() {
    emit(
      state.copyWith(
        isDialogOpen: false,
        ignoreDetectionsUntil: DateTime.now().add(const Duration(seconds: 2)),
      ),
    );
  }
}