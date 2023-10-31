// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'person_model.dart';

class PhysicalPersonModel extends PersonModel {
  final String cpf;
  final DateTime birthAt;

  PhysicalPersonModel({
    required this.cpf,
    required this.birthAt,
    required super.id,
    required super.name,
    required super.address,
    required super.telephone,
    required super.createdAt,
    required super.accounts,
  });

  @override
  String toString() {
    return 'PersonModel(id: $id, name: $name, address: $address, telephone: $telephone, createdAt: $createdAt, accounts: $accounts, cpf: $cpf, birthAt: $birthAt)';
  }
}
