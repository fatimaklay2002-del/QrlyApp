// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QrHistoryItemAdapter extends TypeAdapter<QrHistoryItem> {
  @override
  final int typeId = 0;

  @override
  QrHistoryItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QrHistoryItem(
      id: fields[0] as String,
      content: fields[1] as String,
      type: fields[2] as HistoryItemType,
      timestamp: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, QrHistoryItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QrHistoryItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HistoryItemTypeAdapter extends TypeAdapter<HistoryItemType> {
  @override
  final int typeId = 1;

  @override
  HistoryItemType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HistoryItemType.scanned;
      case 1:
        return HistoryItemType.generated;
      default:
        return HistoryItemType.scanned;
    }
  }

  @override
  void write(BinaryWriter writer, HistoryItemType obj) {
    switch (obj) {
      case HistoryItemType.scanned:
        writer.writeByte(0);
        break;
      case HistoryItemType.generated:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryItemTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
