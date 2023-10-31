String? validateTelephone(String value) {
  final formatTelephone = RegExp(r'^\(?\d{2}\)?\s?\d{5}-\d{4}$');
  if (!formatTelephone.hasMatch(value)) {
      return "Telefone invalido, tente (11) 12345-6789";
    }
    return null;
}

