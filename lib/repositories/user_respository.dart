import 'package:mind_ease/models/user.dart';
import 'package:mind_ease/services/api.dart';

class UserRepository {
  final List<User> _users = [
    User(
        name: 'Ezequiel Pires',
        email: 'ezequiel.pires082000@gmail.com',
        phone: '(64) 99969-8100',
        password: '12345678')
  ];
  final ApiService api = ApiService();

  List<User> findUsers() {
    return _users;
  }

  User? findUserByEmail(String email) {
    try {
      return _users.firstWhere((element) => element.email == email);
    } catch (error) {
      return null;
    }
  }

  Future<User?> addUser(User user) async {
    try {
      var res = await api.post('users', {
        "name": user.name,
        "phone": user.phone,
        "email": user.email,
        "password": user.password
      });
      if(res['success']) {
        return user;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  bool removeUser(User user) {
    final User? userAlreadyExists = findUserByEmail(user.email);
    if (userAlreadyExists != null) {
      _users.remove(user);
      return true;
    } else {
      return false;
    }
  }
}
