class Validators {
  // Email validation with comprehensive regex
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$',
  );

  // Password strength validation
  static final RegExp _passwordUpperCase = RegExp(r'[A-Z]');
  static final RegExp _passwordLowerCase = RegExp(r'[a-z]');
  static final RegExp _passwordNumbers = RegExp(r'[0-9]');
  static final RegExp _passwordSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  /// Validates email format
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    
    if (value.length > 254) {
      return 'Email is too long';
    }
    
    if (!_emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    
    return null;
  }

  /// Validates password strength
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    
    if (value.length > 128) {
      return 'Password is too long';
    }
    
    if (!_passwordUpperCase.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    
    if (!_passwordLowerCase.hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    
    if (!_passwordNumbers.hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    
    if (!_passwordSpecial.hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    
    // Check for common weak passwords
    if (_isCommonPassword(value.toLowerCase())) {
      return 'This password is too common. Please choose a stronger password';
    }
    
    return null;
  }

  /// Validates name fields
  static String? validateName(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (value.trim().length < 2) {
      return '$fieldName must be at least 2 characters long';
    }
    
    if (value.length > 50) {
      return '$fieldName is too long';
    }
    
    // Only allow letters, spaces, and common name characters
    final nameRegex = RegExp(r"^[a-zA-Z\s\-\.\']+$");
    if (!nameRegex.hasMatch(value)) {
      return '$fieldName can only contain letters, spaces, hyphens, and apostrophes';
    }
    
    return null;
  }

  /// Validates password confirmation
  static String? validatePasswordConfirmation(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    
    if (value != password) {
      return 'Passwords do not match';
    }
    
    return null;
  }

  /// Check if password is in common password list (simplified)
  static bool _isCommonPassword(String password) {
    const commonPasswords = [
      'password', '123456', '12345678', 'qwerty', 'abc123',
      'password123', 'admin', 'letmein', 'welcome', 'monkey',
      'dragon', 'master', 'sunshine', 'princess', 'football',
      'baseball', 'shadow', 'superman', 'michael', 'computer',
      'jordan', 'harley', 'ranger', 'hunter', 'taylor'
    ];
    
    return commonPasswords.contains(password);
  }

  /// Sanitize input to prevent XSS (basic)
  static String sanitizeInput(String input) {
    return input
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#x27;')
        .replaceAll('&', '&amp;')
        .trim();
  }
}