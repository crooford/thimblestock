import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/clients.dart';

class ClientRepository {
  late final CollectionReference _collection;
  // _clients = <String, ClientEntity>{};

  ClientRepository() {
    _collection = FirebaseFirestore.instance.collection("clients");
  }

 /*  ClientEntity? findByClientEmail(String clientEmail) {
    var client = _clients[clientEmail];

    return client;
  } */

  Future<void> editClient(ClientEntity client) async {
    _collection.withConverter(
        fromFirestore: ClientEntity.fromFirestore,
        toFirestore: (value, options) => value.toFirestore())
        .add(client);
  }
}
