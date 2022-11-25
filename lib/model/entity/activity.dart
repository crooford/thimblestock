import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityEntity {
  late String? user;
  late String? typeOfActivity;
  late String? detailOfActivity;
  late String? timeOfActivity;

  ActivityEntity({
    this.user,
    this.typeOfActivity,
    this.detailOfActivity,
    this.timeOfActivity,
  });

  factory ActivityEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    var data = snapshot.data();

    return ActivityEntity(
      
      typeOfActivity: data?["typeOfActivity"],
      detailOfActivity: data?["detailOfActivity"],
      timeOfActivity: data?["timeOfActivity"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (user != null && user!.isNotEmpty) "user": user,
      if (typeOfActivity != null && typeOfActivity!.isNotEmpty)
        "typeOfActivity": typeOfActivity,
      if (detailOfActivity != null && detailOfActivity!.isNotEmpty)
        "detailOfActivity": detailOfActivity,
      if (timeOfActivity != null) "timeOfActivity": timeOfActivity,
    };
  }

  @override
  String toString() {
    return "Nombre:  ";
  }
}
