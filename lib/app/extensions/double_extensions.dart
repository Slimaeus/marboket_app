extension DoubleExtensions on double {
  String removeRedundantDecimal() {
    String stringValue = toString();

    // Remove trailing zeros and the decimal point if there are no digits after it
    stringValue = stringValue.replaceAll(RegExp(r'\.0*$'), '');

    return stringValue;
  }

  String formatNumberWithCommas() {
    String formattedNumber = toString();
    String result = '';

    for (int i = formattedNumber.length - 1, count = 0; i >= 0; i--) {
      result = formattedNumber[i] + result;
      count++;

      if (count == 3 && i > 0) {
        result = ',$result';
        count = 0;
      }
    }

    return result;
  }
}
