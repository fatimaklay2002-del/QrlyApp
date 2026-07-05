import 'package:qrly_app/features/scan_qr_code/logic/scan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/scan_history_model.dart';
import '../../scan_history/logic/history_cubit.dart';

class ScanCubit extends Cubit<ScanState> {
  final HistoryCubit historyCubit;

  ScanCubit(this.historyCubit) : super(const ScanState());

  Future<void> handleDetected(String value) async {
    if (state.isProcessing) return;
    emit(state.copyWith(isProcessing: true));

    final item = QrHistoryItem(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      content: value,
      type: HistoryItemType.scanned,
      timestamp: DateTime.now(),
    );
    await historyCubit.addItem(item);

    emit(state.copyWith(isProcessing: false));
  }
}
