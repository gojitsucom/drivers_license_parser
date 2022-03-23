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
}
