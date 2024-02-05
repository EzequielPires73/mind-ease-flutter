import 'dart:async';

import 'package:mind_ease/blocs/users/user_events.dart';
import 'package:mind_ease/blocs/users/user_states.dart';
import 'package:mind_ease/models/user.dart';
import 'package:mind_ease/repositories/user_respository.dart';

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
    _outputUserController.add(UserLoadingState(isLoading: true));
    switch (event.runtimeType) {
      case FindUsersEvent:
        var users = _userRepo.findUsers();
        _outputUserController.add(UserSuccessState(users: users));
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
          var users = _userRepo.findUsers();
          _outputUserController.add(UserSuccessState(users: users));
        } else {
          _outputUserController
              .add(UserErrorState(message: 'Usuário não foi encontrado.'));
        }
        break;
    }
    _outputUserController.add(UserLoadingState(isLoading: false));
  }
}
