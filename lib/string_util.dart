extension MyString on String {
  String capitalize(String s) {
    if (s != null && s.isNotEmpty) {
      return s[0].toUpperCase() + s.substring(1).toLowerCase();
    }

    return s;
  }
}