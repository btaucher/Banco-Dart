enum PersonType {
  legal(2),
  physical(1);

  const PersonType(this.code);
  final int code;

  bool get isLegal => this == PersonType.legal;
  bool get isPhysical => this == PersonType.physical;

  static PersonType fromCode(int code) {
    return PersonType.values.firstWhere((e) => e.code == code);
  }
}
