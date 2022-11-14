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
    _collection
        .withConverter<ClientEntity>(
            fromFirestore: ClientEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .add(client);
  }

  Future<List<ClientEntity>> getAllByUserId(String id) async {
    var query = await _collection
        .where("user", isEqualTo: id)
        .withConverter<ClientEntity>(
            fromFirestore: ClientEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .get();

    var clients = query.docs.cast().map<ClientEntity>((e) {
      var client = e.data();
      client.id = e.id;
      return client;
    });
    // clients.sort((a, b) => a.clientName.compareTo(b.clientName));
    return clients.toList()
      ..sort((a, b) =>
          a.clientName!.toLowerCase().compareTo(b.clientName!.toLowerCase()));
  }
}
