import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectEntity{
  late String? user;
  late String? clientName;
  late String? clientEmail;
  late String? details;
  late DateTime? date;

  ProjectEntity({
      this.user,
      this.clientName, 
      this.clientEmail,
      this.details,
      this.date,
      }); 

  factory ProjectEntity.fromFirestore( DocumentSnapshot<Map<String, dynamic>> snapshot,SnapshotOptions? options) {
      var data = snapshot.data();
      return ProjectEntity(
        user: data?["user"],
        details: data?["details"],
        clientName: data?["clientName"],
        date: data?["date"],
        clientEmail: data?["clientEmail"]);
    }

    Map<String, dynamic> toFirestore() {
      return {
        if (user != null && user!.isNotEmpty) "user": user,
        if (details != null && details!.isNotEmpty)
          "details": details,
        if (clientName != null && clientName!.isNotEmpty)
          "clientName": clientName,
        if (date != null)
          "date": date,
        if (clientEmail != null && clientEmail!.isNotEmpty)
          "clientEmail": clientEmail};
    }
}