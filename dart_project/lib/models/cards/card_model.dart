import '../persons/person_model.dart';

abstract class CardModel {
  final PersonModel person;
  final String cardNumber;
  final String cvv;
  final CardFlag flag;
  final DateTime expirationDate;

  CardModel({
    required this.person,
    required this.cardNumber,
    required this.cvv,
    required this.flag,
    required this.expirationDate,
  });
}

enum CardFlag { masterCard, visa }
