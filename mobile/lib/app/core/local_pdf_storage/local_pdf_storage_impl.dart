import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../logger/app_logger.dart';
import '../rest_client/app_rest_client.dart';
import 'local_pdf_storage.dart';

class AppPdfStorageImpl implements AppPdfStorage {
  final AppRestClient _restClient;
  final AppLogger _logger;

  AppPdfStorageImpl(
      {required AppRestClient restClient, required AppLogger logger})
      : _restClient = restClient,
        _logger = logger;

  @override
  
  Future<Uint8List?> getPdfStream(String url, String fileName) async {
    try {
      final documentDirectory = await getApplicationDocumentsDirectory();
      var file =
          File(path.join(documentDirectory.path, path.basename(fileName)));

      final fileExists = await file.exists();

      if (fileExists) {
        return await file.readAsBytes();
      }

      final response = await _restClient.auth().getStream(url);

      if (response.statusCode == 200 && response.data != null) {
        await file.writeAsBytes(response.data!);
        return response.data!;
      }

      return null;
    } catch (e, s) {
      _logger.error(e, s);
      return null;
    }
  }
}
