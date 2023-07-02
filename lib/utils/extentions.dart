extension CheckString on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(trim());
  }

  bool isValidPassword() {
    final String text = trim();
    if (text.length >= 6) {
      return true;
    }

    return false;
  }
}
