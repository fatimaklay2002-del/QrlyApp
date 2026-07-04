import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qrly_app/core/models/scan_history_model.dart';

class HistoryRepository {
  static const String _boxName = 'qr_history_box';

  /// لازم تتنادى مرة واحدة بس في main() قبل runApp
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(QrHistoryItemAdapter());
    Hive.registerAdapter(HistoryItemTypeAdapter());
    await Hive.openBox<QrHistoryItem>(_boxName);
  }

  Box<QrHistoryItem> get _box => Hive.box<QrHistoryItem>(_boxName);

  /// بيرجع كل العناصر مرتبة من الأحدث للأقدم
  List<QrHistoryItem> getAll() {
    final items = _box.values.toList();
    items.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return items;
  }

  Future<void> addItem(QrHistoryItem item) async {
    await _box.put(item.id, item);
  }

  Future<void> deleteItem(String id) async {
    await _box.delete(id);
  }

  /// عشان الـ Cubit يقدر يسمع لأي تغيير يحصل في البيانات مباشرة
  ValueListenable<Box<QrHistoryItem>> listenable() {
    return _box.listenable();
  }
}