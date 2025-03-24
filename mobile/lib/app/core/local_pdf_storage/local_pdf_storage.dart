import 'dart:typed_data';

abstract interface class AppPdfStorage {
  Future<Uint8List?> getPdfStream(String url, String filename);
}
