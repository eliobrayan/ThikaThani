import 'package:meta/meta.dart';

class UserModel {
  final String name;
  final String lastName;
  final String email;

  UserModel(
      {@required this.name, @required this.lastName, @required this.email});

  factory UserModel.fromMap(dynamic data) => UserModel(
        name: data["name"],
        lastName: data["lastName"],
        email: data["email"],
      );
}
