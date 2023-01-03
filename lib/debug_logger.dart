import 'package:logging/logging.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter/material.dart';

// todo 1 create uml untuk singleton pattern

// todo 2 base
abstract class BaseLogger {
  @protected
  late Logger _logger;

  @protected
  DateFormat _dateFormatter = DateFormat('H:m:s.S');
  static const appName = 'singleton_patter_example';

  void log(
    message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      _logger.info(
        message,
        error,
        stackTrace,
      );
}

// todo 3 (next main.dart)
class DebugLogger extends BaseLogger {
  static DebugLogger? _instance;

  DebugLogger._internal() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(_recordHandler);
    _logger = Logger(BaseLogger.appName);
    debugPrint('<DebugLogger> creation');
    _instance = this;
  }

  // lazy instantation
  factory DebugLogger() => _instance ?? DebugLogger._internal();

  void _recordHandler(LogRecord rec) {
    debugPrint(
      '${_dateFormatter.format(rec.time)} : ${rec.message}, ${rec.error}',
    );
  }
}
