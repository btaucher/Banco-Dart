// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../accounts/account_model.dart';

abstract class PersonModel {
  final int id;
  final String name;
  final String address;
  final String telephone;
  final DateTime createdAt;
  final List<AccountModel> accounts;

  PersonModel({
    required this.id,
    required this.name,
    required this.address,
    required this.telephone,
    required this.createdAt,
    required this.accounts,
  });

  
}
