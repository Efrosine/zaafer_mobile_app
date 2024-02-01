extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(r'^(?=.*[a-z])(?=.*\d).{8,}$').hasMatch(this);
  }
}

extension ConfirmPasswordValidator on String {
  bool isValidConfirmPassword(String other) {
    return this == other;
  }
}
