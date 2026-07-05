import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class QrImageService {
  /// بتلتقط محتوى أي GlobalKey متلف بـ RepaintBoundary كـ صورة PNG
  static Future<Uint8List?> captureBytes(GlobalKey key) async {
    try {
      final boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return null;
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (_) {
      return null;
    }
  }
 
  static Future<bool> saveToGallery(Uint8List bytes) async {
    try {
      await Gal.putImageBytes(
        bytes,
        name: 'qrly_${DateTime.now().millisecondsSinceEpoch}',
      );
      return true;
    } catch (_) {
      return false;
    }
  }
 
  static Future<void> shareImage(Uint8List bytes, String text) async {
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/qrly_share.png').create();
    await file.writeAsBytes(bytes);
    await Share.shareXFiles([XFile(file.path)], text: text);
  }
  static Future<void> shareQr(GlobalKey key, String text) async {
    final bytes = await captureBytes(key);
    if (bytes == null) {
      await Share.share(text);
    } else {
      await shareImage(bytes, text);
    }
  }

  static Future<void> shareTextOnly(String text) async {
  await SharePlus.instance.share(ShareParams(text: text));
}
}