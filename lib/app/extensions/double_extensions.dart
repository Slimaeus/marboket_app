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

  String convertToShortFormat() {
    if (this < 1000) {
      return toString();
    } else if (this < 1000000) {
      final kValue = (this / 1000).toStringAsFixed(0);
      final remainder = this % 1000;
      return remainder == 0 ? '${kValue}k' : '$kValue.${remainder ~/ 100}k';
    } else {
      final mValue = (this / 1000000).toStringAsFixed(0);
      final remainder = this % 1000000;
      return remainder == 0 ? '${mValue}m' : '$mValue.${remainder ~/ 100000}m';
    }
  }
}
