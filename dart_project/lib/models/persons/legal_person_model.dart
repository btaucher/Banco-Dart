import 'person_model.dart';

class LegalPersonModel extends PersonModel {
  final String cnpj;

  LegalPersonModel({
    required this.cnpj,
    required super.id,
    required super.name,
    required super.address,
    required super.telephone,
    required super.createdAt,
    required super.accounts,
  });

  @override
  String toString() {
    return 'PersonModel(id: $id, name: $name, address: $address, telephone: $telephone, createdAt: $createdAt, accounts: $accounts, cnpj: $cnpj)';
  }
}
