String? validateCnpj(String value) {
  final formatCnpj = RegExp(r'^\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$');
  if (!formatCnpj.hasMatch(value)) {
      return "Cnpj inválido";
    }
    return null;
}
