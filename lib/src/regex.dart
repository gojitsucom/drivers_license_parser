class LicenseRegex {
  static String? firstMatch({required String pattern, required String data}) {
    try {
      final regex = RegExp(pattern, caseSensitive: false);
      final firstMatch = regex.firstMatch(data);

      if (firstMatch == null) {
        return null;
      }
      final matchedGroup = firstMatch.group(1);
      return matchedGroup?.trim();
    } catch (_) {
      return null;
    }
  }
}
