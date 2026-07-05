class ScanState {
  final bool isProcessing;
  final bool isDialogOpen;
  final DateTime? ignoreDetectionsUntil;

  const ScanState({
    this.isProcessing = false,
    this.isDialogOpen = false,
    this.ignoreDetectionsUntil,
  });

  ScanState copyWith({
    bool? isProcessing,
    bool? isDialogOpen,
    DateTime? ignoreDetectionsUntil,
  }) {
    return ScanState(
      isProcessing: isProcessing ?? this.isProcessing,
      isDialogOpen: isDialogOpen ?? this.isDialogOpen,
      ignoreDetectionsUntil: ignoreDetectionsUntil ?? this.ignoreDetectionsUntil,
    );
  }
}
 