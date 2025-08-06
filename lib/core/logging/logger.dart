import 'package:flutter/foundation.dart';

enum LogLevel { debug, info, warning, error, fatal }

enum LogCategory { auth, network, database, ui, navigation, firebase, general }

class Logger {
  static const String _tag = '[StockTool]';

  static void _log(
    LogLevel level,
    LogCategory category,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      final timestamp = DateTime.now().toIso8601String();
      final levelEmoji = _getLevelEmoji(level);
      final categoryName = category.name.toUpperCase();

      final logMessage = '$_tag $levelEmoji [$categoryName] $message';

      switch (level) {
        case LogLevel.debug:
          debugPrint(logMessage);
          break;
        case LogLevel.info:
          debugPrint(logMessage);
          break;
        case LogLevel.warning:
          debugPrint('⚠️  $logMessage');
          break;
        case LogLevel.error:
          debugPrint('❌ $logMessage');
          if (error != null) {
            debugPrint('Error: $error');
          }
          if (stackTrace != null) {
            debugPrint('StackTrace: $stackTrace');
          }
          break;
        case LogLevel.fatal:
          debugPrint('💀 $logMessage');
          if (error != null) {
            debugPrint('Fatal Error: $error');
          }
          if (stackTrace != null) {
            debugPrint('StackTrace: $stackTrace');
          }
          break;
      }
    }

    // In production, you could send logs to a service like Crashlytics
    // _sendToLoggingService(level, category, message, error, stackTrace);
  }

  static String _getLevelEmoji(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return '🔍';
      case LogLevel.info:
        return 'ℹ️';
      case LogLevel.warning:
        return '⚠️';
      case LogLevel.error:
        return '❌';
      case LogLevel.fatal:
        return '💀';
    }
  }

  // Convenience methods for different log levels
  static void debug(LogCategory category, String message) {
    _log(LogLevel.debug, category, message);
  }

  static void info(LogCategory category, String message) {
    _log(LogLevel.info, category, message);
  }

  static void warning(LogCategory category, String message) {
    _log(LogLevel.warning, category, message);
  }

  static void error(
    LogCategory category,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.error,
      category,
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void fatal(
    LogCategory category,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.fatal,
      category,
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  // Category-specific convenience methods
  static void auth(String message) =>
      _log(LogLevel.info, LogCategory.auth, message);
  static void authError(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.error,
      LogCategory.auth,
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void firebase(String message) =>
      _log(LogLevel.info, LogCategory.firebase, message);
  static void firebaseError(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.error,
      LogCategory.firebase,
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void navigation(String message) =>
      _log(LogLevel.info, LogCategory.navigation, message);
  static void ui(String message) =>
      _log(LogLevel.info, LogCategory.ui, message);
  static void network(String message) =>
      _log(LogLevel.info, LogCategory.network, message);
  static void database(String message) =>
      _log(LogLevel.info, LogCategory.database, message);
}
