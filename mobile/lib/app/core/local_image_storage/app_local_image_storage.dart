import 'dart:typed_data';

abstract interface class AppLocalImageStorage {
  Future<Uint8List?> getImageStream(String url, String filename);
}
