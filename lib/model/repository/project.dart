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
    _collection
        .withConverter(
            fromFirestore: ProjectEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .add(project);
  }

  Future<List<ProjectEntity>> getAllByUserId(String id) async {
    var query = await _collection
        .where("user", isEqualTo: id)
        .withConverter<ProjectEntity>(
            fromFirestore: ProjectEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .get();

    var projects = query.docs.cast().map<ProjectEntity>((e) {
      var projects = e.data();
      projects.user = e.id;
      return projects;
    });
    // clients.sort((a, b) => a.clientName.compareTo(b.clientName));
    return projects.toList()
      ..sort((a, b) =>
          a.projectName!.toLowerCase().compareTo(b.projectName!.toLowerCase()));
  }
}
