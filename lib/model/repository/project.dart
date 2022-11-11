import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/projects.dart';

class ProjectRepository {
  late final CollectionReference _collection;
  // _clients = <String, ClientEntity>{};

  ProjectRepository() {
    _collection = FirebaseFirestore.instance.collection("projects");
  }

 /*  ClientEntity? findByClientEmail(String clientEmail) {
    var client = _clients[clientEmail];

    return client;
  } */

  Future<void> editProject(ProjectEntity project) async {
    _collection.withConverter(
        fromFirestore: ProjectEntity.fromFirestore,
        toFirestore: (value, options) => value.toFirestore())
        .add(project);
  }
}