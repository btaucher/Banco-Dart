import '../cards/card_model.dart';

abstract class AccountModel {
  double balance;
  final String accountNumber;
  final String agencyNumber;
  // TODO(danifbn): Definir o tipo da transação
  final List transactionHistory;
  final CardModel card;
  final AccountType accountType;

  AccountModel({
    required this.balance,
    required this.accountNumber,
    required this.agencyNumber,
    required this.transactionHistory,
    required this.card,
    required this.accountType,
  });
  @override
  String toString() {
    return "Suanconta é do tipo $accountType Numero da conta: $accountNumber, Numero do cartão: ${card.cardNumber}, cvv: ${card.cvv}, Bandeira: ${card.flag}, Saldo atual $balance";
  }
}

enum AccountType {
  current(1),
  saving(2),
  salary(3),
  investment(4);

  const AccountType(this.code);
  final int code;

  static AccountType fromCode(int code) {
    return AccountType.values.firstWhere((e) => e.code == code);
  }
}
