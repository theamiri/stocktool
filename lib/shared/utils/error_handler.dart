import '../../core/logging/logger.dart';

/// Handles errors securely by providing user-friendly messages
/// while logging detailed information for debugging
class ErrorHandler {
  /// Maps Firebase/system errors to user-friendly messages
  static String getDisplayError(dynamic error) {
    final errorString = error.toString().toLowerCase();

    // Firebase Auth specific errors
    if (errorString.contains('user-not-found') ||
        errorString.contains('wrong-password') ||
        errorString.contains('invalid-credential')) {
      return 'Invalid email or password. Please try again.';
    }

    if (errorString.contains('email-already-in-use')) {
      return 'An account with this email already exists.';
    }

    if (errorString.contains('weak-password')) {
      return 'Password is too weak. Please choose a stronger password.';
    }

    if (errorString.contains('invalid-email')) {
      return 'Please enter a valid email address.';
    }

    if (errorString.contains('too-many-requests')) {
      return 'Too many failed attempts. Please try again later.';
    }

    if (errorString.contains('network')) {
      return 'Network error. Please check your connection.';
    }

    if (errorString.contains('timeout')) {
      return 'Request timed out. Please try again.';
    }

    // Generic error for anything else - never expose system details
    return 'Something went wrong. Please try again later.';
  }

  /// Logs detailed error for debugging (replace with proper logging in production)
  static void logError(dynamic error, StackTrace? stackTrace, String context) {
    // In production, this should use a proper logging service
    Logger.error(
      LogCategory.general,
      'Error in $context',
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Generic authentication error
  static const String authenticationError =
      'Authentication failed. Please try again.';

  /// Generic network error
  static const String networkError =
      'Network error. Please check your connection.';

  /// Generic server error
  static const String serverError = 'Server error. Please try again later.';
}
