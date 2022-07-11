class LicenseRegex {
  static String? firstMatch({required String pattern, required String data, bool matchLineStartOnly = true}) {
    try {
      final regex = RegExp("${matchLineStartOnly ? "\\b": ""}$pattern", caseSensitive: false);
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
