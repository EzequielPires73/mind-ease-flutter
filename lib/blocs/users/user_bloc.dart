import 'dart:async';

import 'package:new_app/blocs/users/user_events.dart';
import 'package:new_app/blocs/users/user_states.dart';
import 'package:new_app/models/user.dart';
import 'package:new_app/repositories/user_respository.dart';

class UserBloc {
  final _userRepo = UserRepository();

  final StreamController<UserEvents> _inputUserController =
      StreamController<UserEvents>();
  final StreamController<UserState> _outputUserController =
      StreamController<UserState>();

  Sink<UserEvents> get inputClient => _inputUserController.sink;
  Stream<UserState> get stream => _outputUserController.stream;

  UserBloc() {
    _inputUserController.stream.listen(_mapEventsToState);
  }

  _mapEventsToState(UserEvents event) async {
    List<User> users = [];
    _outputUserController.add(UserLoadingState(isLoading: true));
    switch (event.runtimeType) {
      case FindUsersEvent:
        users = _userRepo.findUsers();
        break;
      case FindUserByEmailEvent:
        var user =
            _userRepo.findUserByEmail((event as FindUserByEmailEvent).email);
        if (user == null)
          _outputUserController
              .add(UserErrorState(message: 'Usuário não foi encontrado.'));
        break;
      case AddUserEvent:
        var user = await _userRepo.addUser((event as AddUserEvent).user);
        if (user == null) {
          _outputUserController
              .add(UserErrorState(message: 'Usuário já existe.'));
        } else {
          _outputUserController.add(
              UserSuccessCreateState(message: 'Usuário criado com sucesso.'));
        }
        break;
      case RemoveUserEvent:
        var success = _userRepo.removeUser((event as RemoveUserEvent).user);
        if (success) {
          users = _userRepo.findUsers();
        } else {
          _outputUserController
              .add(UserErrorState(message: 'Usuário não foi encontrado.'));
        }
        break;
    }

    _outputUserController.add(UserSuccessState(users: users));
    _outputUserController.add(UserLoadingState(isLoading: false));
  }
}
