import 'package:logger/logger.dart';

import 'app_logger.dart';

final class AppLoggerImpl implements AppLogger {
  final logger = Logger();
  var messages = <String>[];

  @override
  void debug(message, [error, StackTrace? stacktrace]) {
    logger.d(message, error: error, stackTrace: stacktrace);
  }

  @override
  void error(message, [error, StackTrace? stacktrace]) {
    logger.e(message, error: error, stackTrace: stacktrace);
  }

  @override
  void info(message, [error, StackTrace? stacktrace]) {
    logger.i(message, error: error, stackTrace: stacktrace);
  }

  @override
  void warning(message, [error, StackTrace? stacktrace]) {
    logger.w(message, error: error, stackTrace: stacktrace);
  }

  @override
  void append(message) {
    messages.add(message);
  }

  @override
  void closeAppend() {
    logger.i(messages.join('\n'));
    messages = [];
  }
}
