import 'dart:io';

import 'typedefs.dart';

class Console {
  static void write(String message) {
    stdout.writeln(message);
  }

  static String writeAndReadWithValidator(
    String message,
    Validator validator,
  ) {
    // do while - Sempre vai executar no minimo 1x
    // while - Pode ser que nunca execute

    String? errorMessage;
    String value;

    // Recebo o texto
    // Valido
    // True -> saiu
    // False -> repito
    do {
      value = writeAndRead(message);

      errorMessage = validator(value);
      if (errorMessage != null) {
        write(errorMessage);
        writeEmpty();
      }
    } while (errorMessage != null);

    return value;
  }

  static void writeEmpty() {
    stdout.writeln();
  }

  static String writeAndRead(String message) {
    stdout.write(message);
    return read();
  }

  static String read() {
    return stdin.readLineSync()!;
  }

  static int readInt() {
    final value = stdin.readLineSync()!;

    return int.parse(value);
  }

  static void clearTerminal() {
    if (Platform.isWindows) {
      print(Process.runSync("cls", [], runInShell: true).stdout);
    } else {
      print(Process.runSync("clear", [], runInShell: true).stdout);
    }
  }

  static String writeAndReadWithValidatorGenerics<T>(
    String message, {
    required ValidatorGenerics<T> validator,
    required T? Function(String) parser,
  }) {
    // do while - Sempre vai executar no minimo 1x
    // while - Pode ser que nunca execute
    write(message);

    String? errorMessage;
    String value;

    // Recebo o texto
    // Valido
    // True -> saiu
    // False -> repito
    do {
      value = read();

      final parsedValue = parser(value);
      if (parsedValue == null) {
        write('Valor inválido');
      }

      errorMessage = validator(parsedValue as T);
      if (errorMessage != null) {
        write(errorMessage);
        write('Digite novamente');
      }
    } while (errorMessage != null);

    return value;
  }
}
