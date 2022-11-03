import 'request/login.dart';

import '../model/repository/user.dart';

class LoginController {
  late final UserRepository _userRepository;

  LoginController() {
    _userRepository = UserRepository();
  }

  String validateEmailPassord(LoginRequest request) {
    //consultar el usuario que tenga el correo dado
    var user = _userRepository.findByEmail(request.email);
    //verificar si la clave es igual a la de la BD
    if (user.password != request.password) {
      throw Exception("Credenciales Inválidas");
    }
    return user.name!;
  }
}
