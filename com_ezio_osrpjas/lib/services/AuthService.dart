import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Authservice extends ChangeNotifier{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;

  bool isLoading = true;

  Authservice(){
    _AuthCheck();
  }

  _AuthCheck(){
    _auth.authStateChanges().listen((User? user) {
      user = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

}