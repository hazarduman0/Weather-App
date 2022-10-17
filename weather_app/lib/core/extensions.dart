import 'package:weather_app/core/enums.dart';

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

extension UvExtension on UvIndex {
  String uvString() {
    switch (this) {
      case UvIndex.low:
        return 'Low';
      case UvIndex.medium:
        return 'Medium';
      case UvIndex.high:
        return 'High';
      case UvIndex.veryhigh:
        return 'Very High';
      case UvIndex.extremelyhigh:
        return 'Extremely High';
      default:
        return '';
    }
  }
}
