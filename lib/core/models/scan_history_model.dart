import 'package:hive/hive.dart';
part 'scan_history_model.g.dart';

@HiveType(typeId: 1)              
enum HistoryItemType {
  @HiveField(0)                  
  scanned,
  @HiveField(1)
  generated,
}

@HiveType(typeId: 0)
class QrHistoryItem extends HiveObject {   
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final HistoryItemType type;

  @HiveField(3)
  final DateTime timestamp;

  QrHistoryItem({
    required this.id,
    required this.content,
    required this.type,
    required this.timestamp,
  });
}