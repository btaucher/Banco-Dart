import 'persons/person_model.dart';

class UserModel {
  final int id;
  final String email;
  final String password;
  final PersonModel person;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.person,
  });
}
