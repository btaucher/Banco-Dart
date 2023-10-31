DateTime parseDate(String value) {
  final parts = value.split('/').map(int.parse).toList();

  final day = parts[0];
  final month = parts[1];
  final year = parts[2];

  return DateTime(year, month, day);
}
