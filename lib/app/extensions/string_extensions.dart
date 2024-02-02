extension StringExtensions on String {
  String convertToFriendlyUrlName() {
    // Replace spaces with hyphens and convert to lowercase
    return replaceAll(' ', '-').toLowerCase();
  }
}
