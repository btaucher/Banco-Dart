import 'card_model.dart';

class DebitCardModel extends CardModel {
  DebitCardModel({
    required super.person,
    required super.cardNumber,
    required super.cvv,
    required super.flag,
    required super.expirationDate,
  });
}
