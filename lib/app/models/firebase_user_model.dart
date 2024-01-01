import 'package:cloud_firestore/cloud_firestore.dart';

class UserField {
  static const String name = 'name';
  static const String image = 'image';
  static const String lastMessage = 'lastMessage';
  static const String lastMessageTime = 'lastMessageTime';
}

class FirebaseUser {
  String? name;
  String? email;
  String? image;
  String? uid;
  String? lastMessage;
  Timestamp? lastMessageTime;

  FirebaseUser({
    this.name,
    this.email,
    this.image,
    this.uid,
    this.lastMessage,
    this.lastMessageTime,
  });

  FirebaseUser.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    image = json["image"];
    uid = json["uid"];
    lastMessage = json["lastMessage"];
    lastMessageTime = json["lastMessageTime"];
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "image": image,
      "name": name,
      "lastMessage": lastMessage,
      "lastMessageTime": lastMessageTime,
    };
  }
}
