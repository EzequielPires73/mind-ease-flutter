import 'package:new_app/models/user.dart';

abstract class UserEvents {}

class FindUsersEvent extends UserEvents {}
class AddUserEvent extends UserEvents {
  User user;

  AddUserEvent({required this.user});
}
class RemoveUserEvent extends UserEvents {
  User user;

  RemoveUserEvent({required this.user});
}
class FindUserByEmailEvent extends UserEvents {
  String email;

  FindUserByEmailEvent({required this.email});
}