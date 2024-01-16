import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/database_service.dart';
import '../models/firebase_user_model.dart';

class FirebaseAuthServices {
  final _auth = FirebaseAuth.instance;

  Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  Future<bool> signUp(
      String name, String email, String password, String uid) async {
    try {
      await DBServices().saveUser(FirebaseUser(
        uid: uid,
        email: email,
        name: name,
        image:
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
        lastMessage: "",
        lastMessageTime: Timestamp.now(),
      ));
      return true;
    } on FirebaseException {
      return false;
    }
  }

  User? get user => FirebaseAuth.instance.currentUser;

  Stream<User?> get onChangedUser => _auth.authStateChanges();

  signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
