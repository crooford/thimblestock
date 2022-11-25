import 'package:cloud_firestore/cloud_firestore.dart';

class CatalogEntity {
  late String? catalogId;
  late String? user;
  late String? addclass;

  CatalogEntity({this.user, this.addclass, this.catalogId});

  factory CatalogEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    var data = snapshot.data();

     return CatalogEntity(
      catalogId: snapshot.id,
      user: data?["user"],
      addclass: data?["addclass"],);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (user != null && user!.isNotEmpty) "user": user,
      if (addclass != null && addclass!.isNotEmpty) "addclass": addclass,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return "CatalogEntity {$user, $addclass}";
  }
  
}
