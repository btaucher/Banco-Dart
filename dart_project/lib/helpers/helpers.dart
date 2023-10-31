import 'dart:math';

class Helpers {
  static int generateID() {
    return Random().nextInt(99999999);
  }

  static int generateCVV() {
    return Random().nextInt(999);
  }
}
