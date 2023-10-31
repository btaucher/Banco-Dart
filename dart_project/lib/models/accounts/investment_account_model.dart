import 'account_model.dart';

class InvestmentAccountModel extends AccountModel {
  InvestmentAccountModel({
    required super.balance,
    required super.accountNumber,
    required super.agencyNumber,
    required super.transactionHistory,
    required super.card,
  }) : super(accountType: AccountType.investment);
}
