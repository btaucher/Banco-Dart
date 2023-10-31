String? validateBirthAt(String value) {
  final birthAt = RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$');
  if (!birthAt.hasMatch(value)) {
      return "Formato de data inválido, tente: 01/01/2023";
    }
    return null;
}
