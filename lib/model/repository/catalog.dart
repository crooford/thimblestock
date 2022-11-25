import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/catalog.dart';

class CatalogRepository {
  late final CollectionReference _collection;
  // _clients = <String, ClientEntity>{};

  CatalogRepository() {
    _collection = FirebaseFirestore.instance.collection("catalogo");
  }

  /*  ClientEntity? findByClientEmail(String clientEmail) {
    var client = _clients[clientEmail];

    return client;
  } */

  Future<void> editCatalog(CatalogEntity catalog) async {
    if (catalog.catalogId != null) {
      _collection
          .withConverter<CatalogEntity>(
              fromFirestore: CatalogEntity.fromFirestore,
              toFirestore: (value, options) => value.toFirestore())
          .doc(catalog.catalogId)
          .set(catalog, SetOptions(merge: true));
    } else {
      _collection
          .withConverter<CatalogEntity>(
              fromFirestore: CatalogEntity.fromFirestore,
              toFirestore: (value, options) => value.toFirestore())
          .add(catalog);
    }
  }
  Future<List<CatalogEntity>> getAllByUserId(String id) async {
    var query = await _collection
        .where("user", isEqualTo: id)
        .withConverter<CatalogEntity>(
            fromFirestore: CatalogEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .get();

    var catalog = query.docs.cast().map<CatalogEntity>((e) {
      var catalog = e.data();
      catalog.user = e.id;
      return catalog;
    });
    // clients.sort((a, b) => a.clientName.compareTo(b.clientName));
    return catalog.toList()
      ..sort((a, b) =>
          a.addclass!.toLowerCase().compareTo(b.addclass!.toLowerCase()));
  }
}
