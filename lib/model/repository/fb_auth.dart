import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationRepository {
  Future<void> createEmailPasswordAccount(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error(('La clave es muy facil.'));
      } else if (e.code == 'email-already-in-use') {
        return Future.error(('Ya existe una cuenta con este email.'));
      }
    }
  }

  Future<void> signInEmailPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('No se encontró un usuario con ese correo');
      } else if (e.code == 'wrong-password') {
        return Future.error('Contraseña equivocada para este usuario.');
      }
    }
  }
}
