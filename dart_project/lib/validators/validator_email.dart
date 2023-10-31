String? validateEmail(String value) {
  final formatEmail = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!formatEmail.hasMatch(value)) {
      return "email inválido";
    }
    return null;
}
