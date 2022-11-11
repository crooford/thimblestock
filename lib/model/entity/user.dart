import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  late String? email;
  late String? name;
  late String? phone;
  late bool? isAdmin;

  UserEntity({this.email, this.name, this.phone, this.isAdmin});

  factory UserEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    var data = snapshot.data();

     return UserEntity(
        email: data?["email"],
        name: data?["name"],
        phone: data?["phone"] ?? "-",
        isAdmin: data?["isAdmin"]);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (email != null && email!.isNotEmpty) "email": email,
      if (name != null && name!.isNotEmpty) "name": name,
      if (phone != null && phone!.isNotEmpty) "phone": phone,
      "isAdmin": isAdmin ?? false
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return "UserEntity {$email, $name, $phone, $isAdmin}";
  }
}
