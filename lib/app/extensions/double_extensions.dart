extension DoubleExtensions on double {
  
  String removeRedundantDecimal() {
    String stringValue = toString();

    // Remove trailing zeros and the decimal point if there are no digits after it
    stringValue = stringValue.replaceAll(RegExp(r'\.0*$'), '');

    return stringValue;
  }
}