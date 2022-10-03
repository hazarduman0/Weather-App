extension CustomNumFunctions on double? {
  bool between({required double min, required double max}) {
    if (this == null) {
      return false;
    }
    if (this! >= min && this! <= max) {
      return true;
    } else {
      return false;
    }
  }
}
