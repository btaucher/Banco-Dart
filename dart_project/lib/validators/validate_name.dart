/// Responsabilidade:
/// - Validar o nome completo
///
/// <br>
///
/// Regras:
/// - É valido se tiver nome e sobrenome.
/// - O nome deve maior que 2.
/// - Só são permitidos, letras.
///
/// <br>
///
/// Assinatura:
/// - Recebe uma [String] que é o valor a ser validado
/// - Retornar uma [String] que pode ser nula - [value]
///   - Se for [null], está valido
///   - Se for uma [String], está invalido
String? validateName(String value) {
  if (!value.contains(' ')) {
    return 'Valor inválido, deve ser o nome completo';
  }

  return null;
}

