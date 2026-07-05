class ScanState {
  final bool isProcessing;
 
  const ScanState({this.isProcessing = false});
 
  ScanState copyWith({bool? isProcessing}) {
    return ScanState(isProcessing: isProcessing ?? this.isProcessing);
  }
}
 