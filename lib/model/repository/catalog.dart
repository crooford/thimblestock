import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/clients.dart';

class CatalogtRepository {
  late final CollectionReference _collection;
  // _clients = <String, ClientEntity>{};

  CatalogRepository() {
    _collection = FirebaseFirestore.instance.collection("catalogo");
  }

 /*  ClientEntity? findByClientEmail(String clientEmail) {
    var client = _clients[clientEmail];

    return client;
  } */

  Future<void> editClient(CatalogEntity client) async {
    _collection.withConverter(
        fromFirestore: CatalogEntity.fromFirestore,
        toFirestore: (value, options) => value.toFirestore())
        .add(client);
  }
}