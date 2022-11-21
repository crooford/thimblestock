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
        .withConverter<UserEntity>(
            fromFirestore: UserEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .get();

    var users = query.docs.cast();

    if (users.isEmpty) {
      return Future.error("Usuario no existe");
    }

    var user = users.first;
    var response = user.data();
    response.id = user.id;

    return response;
  }

  Future<void> save(UserEntity user) async {
    await _collection
        .withConverter(
            fromFirestore: UserEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .add(user);
  }
}
