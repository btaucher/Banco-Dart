enum MenuOptions {
  deposit(1),
  transferPix(2),
  withdraw(3),
  userData(4),
  bankStatement(5),
  buyCredit(6),
  buyDebit(7),
  accessStatement(8);

  const MenuOptions(this.code);
  final int code;
  static MenuOptions fromCode(int code) {
    return MenuOptions.values.firstWhere((e) => e.code == code);
  }
}
