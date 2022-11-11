import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/user.dart';

class UserRepository {
  late final CollectionReference _collection;
  UserRepository() {
    _collection = FirebaseFirestore.instance.collection("users");
  }

  Future<UserEntity> findByEmail(String email) async {
    final query = await _collection
        .where("email", isEqualTo: email)
        .withConverter(
            fromFirestore: UserEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .get();

    var users = query.docs.cast().map((e) => e.data());

    if (users.isEmpty) {
      return Future.error("Usuario no existe");
    }

    return users.first;
  }

  Future<void> save(UserEntity user) async {
    await _collection
        .withConverter(
            fromFirestore: UserEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .add(user);
  }
}
