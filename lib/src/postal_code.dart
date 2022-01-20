class PostalCode {
  final String? postalCode;
  final String? extension;

  PostalCode({this.postalCode, this.extension});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostalCode &&
          runtimeType == other.runtimeType &&
          postalCode == other.postalCode &&
          extension == other.extension;

  @override
  int get hashCode => postalCode.hashCode ^ extension.hashCode;

  @override
  String toString() {
    return 'PostalCode{$postalCode-$extension}';
  }

  /// postal codes can include both the base 5-digit code and the 4-digit routing code
  /// this splits them up and makes it easy to work with
  static PostalCode? parse(String? postalCodeString) {
    if (postalCodeString != null) {
      if (postalCodeString.length == 9) {
        return PostalCode(
          postalCode: postalCodeString.substring(0, 5),
          extension: postalCodeString.substring(5, 9),
        );
      } else {
        return PostalCode(postalCode: postalCodeString);
      }
    }
  }
}
