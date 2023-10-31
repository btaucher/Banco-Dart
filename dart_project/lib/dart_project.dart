import 'package:dart_project/controllers/account_controller.dart';

import 'controllers/person_controller.dart';
import 'controllers/user_controller.dart';
import 'helpers/menu.dart';
import 'models/accounts/account_model.dart';
import 'utils/console.dart';
import 'utils/messages.dart';

void main() {
  Console.clearTerminal();

  Console.write(Messages.welcome);
  Console.writeEmpty();

  // Pessoa
  final person = PersonController.create();
  Console.writeEmpty();
  final user = UserController.create(person: person);

  Console.writeEmpty();
  Console.write(
      '''selecione o tipo de conta que deseja criar:
1 - Corrente,
2 - poupaça,
3 - salario,
4 - investimentos,
''');
  final accountTypeCode = Console.readInt();
  final accountType = AccountType.fromCode(accountTypeCode);

  AccountModel account =
      AccountController.create(person: person, accountType: accountType);

  Console.write(
      '''selecione o que deseja fazer:
1 - Depositar
2 - Transferir - Pix por nome
3 - Sacar
4 - Ver Dados
5 - Extrato
6 - Comprar com debito
7 - Comprar com crédito,
8 - Ver fatura
''');

  final menuActionCode = Console.readInt();
  final menuAction = MenuOptions.fromCode(menuActionCode);

  switch (menuAction) {
    case MenuOptions.deposit:
      account = AccountController.deposit(account: account);
      break;
    case MenuOptions.withdraw:
      account = AccountController.withdraw(account: account);
    case MenuOptions.transferPix:
      account = AccountController.transferPix(account: account);
    case MenuOptions.bankStatement:
      account.transactionHistory
          .map((transaction) => Console.write(transaction));

    default:
  }

  switch (accountType) {
    case AccountType.current:
    case AccountType.saving:
    case AccountType.salary:
    case AccountType.investment:
  }
}
