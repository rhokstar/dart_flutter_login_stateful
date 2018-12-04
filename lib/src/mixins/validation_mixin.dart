class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please enter a valid email address.';
    }

    return null;
  }

  String validatePassword(String value) {
    // Validate this field and return state to validate function
    // Return null if valid
    // Otherwise string (with error message) if invalid
    if (value.length < 4) {
      return 'Password must be at least 4 characters.';
    }

    return null;
  }
}
