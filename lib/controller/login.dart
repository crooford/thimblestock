import 'request/register.dart';
import '../model/entity/user.dart';
import '../model/repository/fb_auth.dart';
import 'request/login.dart';
import '../model/repository/user.dart';
import 'response/userinfo.dart';

class LoginController {
  late final UserRepository _userRepository;
  late final FirebaseAuthenticationRepository _authRepository;

  LoginController() {
    _userRepository = UserRepository();
    _authRepository = FirebaseAuthenticationRepository();
  }

  Future<UserInfoResponse> validateEmailPassword(LoginRequest request) async {
    await _authRepository.signInEmailPassword(request.email, request.password);
    // Consultar el usuario que tenga el correo dado
    var user = await _userRepository.findByEmail(request.email);

    return UserInfoResponse(
      id: user.id,
      email: user.email,
      name: user.name,
      isAdmin: user.isAdmin,
    );
  }

  Future<void> registerNewUser(RegisterRequest request,
      {bool adminUser = false}) async {
    //validar si el usuario ya existe
    try {
      await _userRepository.findByEmail(request.email);
      return Future.error("Ya existe un usuario con este E-mail");
    } catch (e) {
      // el correo no existe

      // crear correo/clave en auth
      await _authRepository.createEmailPasswordAccount(
          request.email, request.password);
      // agregar informacion adicional en BD
      _userRepository.save(UserEntity(
          email: request.email,
          name: request.name,
          phone: request.phone,
          isAdmin: adminUser));
    }
  }

  Future<void> logout() async {
    await _authRepository.signOut();
  }
}
