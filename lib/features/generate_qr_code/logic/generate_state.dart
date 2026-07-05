class GenerateState {
  final String text;
  final bool saved;
  final bool isSaving;
 
  const GenerateState({
    this.text = '',
    this.saved = false,
    this.isSaving = false,
  });
 
  bool get hasContent => text.trim().isNotEmpty;
 
  GenerateState copyWith({String? text, bool? saved, bool? isSaving}) {
    return GenerateState(
      text: text ?? this.text,
      saved: saved ?? this.saved,
      isSaving: isSaving ?? this.isSaving,
    );
  }
}