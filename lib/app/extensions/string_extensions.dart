extension StringExtensions on String {
  String convertToFriendlyUrlName() {
    // Replace spaces with hyphens and convert to lowercase
    return replaceAll(' ', '-').toLowerCase();
  }

  String formatNumberWithCommas() {
    final regex = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return replaceAll(regex, ',');
  }

  String truncate(int maxLength) {
    if (length <= maxLength) {
      return this;
    } else {
      return '${substring(0, maxLength)}...';
    }
  }
}
