import 'package:flutter/material.dart';

class RegisterRequest {
  late String name;
  late String email;
  late String? phone;
  late String password;
  late bool isAdmin;

  @override
  String toString() {
    return "$name, $email, $phone, $password, $isAdmin";
  }
}
