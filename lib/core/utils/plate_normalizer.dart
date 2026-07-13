abstract final class PlateNormalizer {
  static String normalize(String value) {
    return value
        .trim()
        .toUpperCase()
        .replaceAll(RegExp(r'[\s\-_/]'), '');
  }
}
