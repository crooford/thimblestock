class UserEntity {
  late String? email;
  late String? name;
  late String? phone;
  late String? password;
  late bool? isAdmin;

  UserEntity({this.email, this.name, this.phone, this.password, this.isAdmin});

   @override
  String toString() {
    // TODO: implement toString
    return "UserEntity {$email, $name, $phone, $isAdmin}";
  }
}
