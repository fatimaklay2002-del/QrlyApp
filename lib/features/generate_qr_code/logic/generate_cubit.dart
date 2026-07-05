import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/models/scan_history_model.dart';
import '../../../core/services/qr_image_service.dart';
import '../../scan_history/logic/history_cubit.dart';
import 'generate_state.dart';


class GenerateCubit extends Cubit<GenerateState> {
  final HistoryCubit historyCubit;
 
  GenerateCubit(this.historyCubit) : super(const GenerateState());
 
  void updateText(String value) {
    emit(state.copyWith(text: value, saved: false));
  }
 
  /// بتحفظ في السجل، ولو فيه صورة ملتقطة بتحفظها في المعرض كمان
  Future<void> saveToHistory(Uint8List? imageBytes) async {
    if (!state.hasContent || state.saved || state.isSaving) return;
    emit(state.copyWith(isSaving: true));
 
    final item = QrHistoryItem(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      content: state.text.trim(),
      type: HistoryItemType.generated,
      timestamp: DateTime.now(),
    );
    await historyCubit.addItem(item);
 
    if (imageBytes != null) {
      await QrImageService.saveToGallery(imageBytes);
    }
 
    emit(state.copyWith(isSaving: false, saved: true));
  }
}
 