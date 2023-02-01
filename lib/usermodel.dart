import 'package:flutter/foundation.dart';

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? phonenumber;

  UserModel({this.name, this.phonenumber, this.email, this.uid});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map["uid"],
      email: map["email"],
      phonenumber: map["Phone Number"],
      name: map["Name"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'phonenumber': phonenumber,
      'name': name,
    };
  }
}
