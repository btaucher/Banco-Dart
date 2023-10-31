String? validateCpf(String value) {
  final formatCpf = RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$');
  if (!formatCpf.hasMatch(value)) {
      return "CPF inválido";
    }
    return null;
}

