import '../entity/users.dart';

class UserRepository {
  final _users = <String, UserEntity>{};

  UserRepository() {
    _users["leonnarddo@gmail.com"] = UserEntity(
        email: "leonnarddo@gmail.com",
        name: "Leonardo Ramirez",
        phone: "3181234567",
        password: "123456",
        isAdmin: true);
    _users["escuderocarlos23@gmail.com"] = UserEntity(
        email: "escuderocarlos23@gmail.com",
        name: "Carlos Escudero",
        phone: "3101234567",
        password: "123456",
        isAdmin: true);
    _users["danigv12345@gmail.com"] = UserEntity(
        email: "danigv12345@gmail.com",
        name: "Daniela Gil",
        phone: "3211234567",
        password: "123456",
        isAdmin: true);
    _users["usuarioregular@gmail.com"] = UserEntity(
        email: "usuarioregular@gmail.com",
        name: "Juanito Alimaña",
        phone: "0001234567",
        password: "123456",
        isAdmin: false);
  }

  UserEntity findByEmail(String email) {
    var user = _users[email];

    if (user == null) {
      throw Exception("Usuario no existe");
    }

    return user;
  }
}
