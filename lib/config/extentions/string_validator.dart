extension Validator on String {
  bool isValidEmail() {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(this);
  }

  bool isValidPassword() {
    return RegExp(r'^(?=.*[a-z])(?=.*\d).{8,}$').hasMatch(this);
  }

  bool isValidConfirmPassword(String other) {
    return this == other;
  }
}
