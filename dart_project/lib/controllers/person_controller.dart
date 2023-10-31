import 'package:dart_project/validators/validate_birth_date.dart';
import 'package:dart_project/validators/validate_cnpj.dart';
import 'package:dart_project/validators/validate_cpf.dart';

import '../helpers/datetime_extension.dart';
import '../helpers/helpers.dart';
import '../helpers/person_type.dart';
import '../models/persons/legal_person_model.dart';
import '../models/persons/person_model.dart';
import '../models/persons/physical_person_model.dart';
import '../utils/console.dart';
import '../utils/messages.dart';
import '../validators/validate_name.dart';
import 'package:dart_project/validators/validate_telephone.dart';

class PersonController {
  static PersonModel create() {
    Console.write(Messages.choosePersonType);

    final personTypeSelectedCode = Console.readInt();
    final personType = PersonType.fromCode(personTypeSelectedCode);

    late final PersonModel person;

    final id = Helpers.generateID();
    final createdAt = DateTime.now();

    switch (personType) {
      case PersonType.physical:
        final name = Console.writeAndReadWithValidator(
          'Digite seu nome completo: ',
          validateName,
        );
        final telephone = Console.writeAndReadWithValidator(
          'Digite seu telefone: ',
          validateTelephone,
        );
        final address = Console.writeAndRead('Digite seu endereço: ');
        final cpf = Console.writeAndReadWithValidator(
          'Digite seu cpf: ',
          validateCpf,
        );
        final birthAt = Console.writeAndReadWithValidator(
          'Digite sua data de nascimento: ',
          validateBirthAt,
        );

        person = PhysicalPersonModel(
          cpf: cpf,
          birthAt: parseDate(birthAt),
          id: id,
          name: name,
          address: address,
          telephone: telephone,
          createdAt: createdAt,
          accounts: [],
        );
      case PersonType.legal: //validador nome fantasia
        final name = Console.writeAndReadWithValidator(
          'Digite o nome fantasia: ',
          validateName,
        );
        final telephone = Console.writeAndReadWithValidator(
          'Digite seu telefone: ',
          validateTelephone,
        );
        final address = Console.writeAndRead('Digite seu endereço: ');
        final cnpj = Console.writeAndReadWithValidator(
          'Digite seu cnpj: ',
          validateCnpj,
        );

        person = LegalPersonModel(
          cnpj: cnpj,
          id: id,
          name: name,
          address: address,
          telephone: telephone,
          createdAt: createdAt,
          accounts: [],
        );
    }

    return person;
  }
}
