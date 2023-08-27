import 'package:new_app/models/user.dart';

abstract class UserState {}

class UserSuccessState extends UserState {
  List<User> users;
  UserSuccessState({required this.users});
}

class UserLoadingState extends UserState {
  bool isLoading;
  UserLoadingState({required this.isLoading});
}

class UserErrorState extends UserState {
  String message;
  UserErrorState({required this.message});
}

class UserSuccessCreateState extends UserState {
  String message;
  UserSuccessCreateState({required this.message});
}
