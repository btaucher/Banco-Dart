import 'package:dart_project/models/accounts/account_model.dart';
import 'package:dart_project/models/accounts/current_account_model.dart';
import 'package:dart_project/models/accounts/investment_account_model.dart';
import 'package:dart_project/models/accounts/salary_account_model.dart';
import 'package:dart_project/models/accounts/saving_account_model.dart';
import 'package:dart_project/models/cards/card_model.dart';

import '../helpers/helpers.dart';
import '../models/cards/debit_card_model.dart';
import '../models/persons/person_model.dart';
import '../utils/console.dart';

class AccountController {
  static AccountModel create(
      {required PersonModel person, required AccountType accountType}) {
    AccountModel model = switch (accountType) {
      AccountType.investment => InvestmentAccountModel(
          balance: 0,
          accountNumber: Helpers.generateID().toString(),
          agencyNumber: '123',
          card: DebitCardModel(
            cardNumber: Helpers.generateID().toString(),
            cvv: Helpers.generateCVV().toString(),
            expirationDate: DateTime.now().add(Duration(days: 3600)),
            flag: CardFlag.masterCard,
            person: person,
          ),
          transactionHistory: [],
        ),
      AccountType.current => CurrentAccountModel(
          balance: 0,
          accountNumber: Helpers.generateID().toString(),
          agencyNumber: '123',
          card: DebitCardModel(
            cardNumber: Helpers.generateID().toString(),
            cvv: Helpers.generateCVV().toString(),
            expirationDate: DateTime.now().add(Duration(days: 3600)),
            flag: CardFlag.masterCard,
            person: person,
          ),
          transactionHistory: [],
        ),
      AccountType.salary => SalaryAccountModel(
          balance: 0,
          accountNumber: Helpers.generateID().toString(),
          agencyNumber: '123',
          card: DebitCardModel(
            cardNumber: Helpers.generateID().toString(),
            cvv: Helpers.generateCVV().toString(),
            expirationDate: DateTime.now().add(Duration(days: 3600)),
            flag: CardFlag.masterCard,
            person: person,
          ),
          transactionHistory: [],
        ),
      AccountType.saving => SavingAccountModel(
          balance: 0,
          accountNumber: Helpers.generateID().toString(),
          agencyNumber: '123',
          card: DebitCardModel(
            cardNumber: Helpers.generateID().toString(),
            cvv: Helpers.generateCVV().toString(),
            expirationDate: DateTime.now().add(Duration(days: 3600)),
            flag: CardFlag.masterCard,
            person: person,
          ),
          transactionHistory: [],
        ),
    };

    CurrentAccountModel(
      balance: 0,
      accountNumber: Helpers.generateID().toString(),
      agencyNumber: '123',
      card: DebitCardModel(
        cardNumber: Helpers.generateID().toString(),
        cvv: Helpers.generateCVV().toString(),
        expirationDate: DateTime.now().add(Duration(days: 3600)),
        flag: CardFlag.masterCard,
        person: person,
      ),
      transactionHistory: [],
    );

    Console.write(model.toString());

    return model;
  }

  static AccountModel deposit({required AccountModel account}) {
    final deposit = Console.writeAndReadWithValidator(
      'Digite o valor a depositar: ',
      (value) {
        final deposit = double.parse(value);
        if (deposit.isNegative || deposit == 0) {
          return "O valor precisa ser maior que 0";
        }
        return null;
      },
    );
    final depositValue = double.parse(deposit);

    account.transactionHistory.add("+ deposito de $depositValue");
    account.balance = account.balance + depositValue;
    return account;
  }

  static AccountModel withdraw({required AccountModel account}) {
    final deposit = Console.writeAndReadWithValidator(
      'Digite o valor a sacar: ',
      (value) {
        final withdraw = double.parse(value);
        if (withdraw.isNegative || withdraw == 0) {
          return "O valor precisa ser maior que 0";
        } else if (withdraw > account.balance) {
          return "O valor do saque é maior que o saldo atual, não é possivel prosseguir";
        }

        return null;
      },
    );

    final withdrawValue = double.parse(deposit);
    account.transactionHistory.add("- saque de $withdrawValue");
    account.balance = account.balance - withdrawValue;
    return account;
  }

  static AccountModel transferPix({required AccountModel account}) {
    final deposit = Console.writeAndReadWithValidator(
      'Digite o valor do pix: ',
      (value) {
        final withdraw = double.parse(value);
        if (withdraw.isNegative || withdraw == 0) {
          return "O valor precisa ser maior que 0";
        } else if (withdraw > account.balance) {
          return "O valor do pix é maior que o saldo atual, não é possivel prosseguir";
        }

        return null;
      },
    );

    final pixValue = double.parse(deposit);
    account.transactionHistory.add("- pix de $pixValue");
    account.balance = account.balance - pixValue;
    return account;
  }
}
// compra no debito é igual saque
// transferencia é igual saque

/* criar coontroller do cartao 
recebe os dados do cartao, compra com credito adiciona um iten na lista de itens tipo extrato,
para comprar no credito valida se tem limite
*/
