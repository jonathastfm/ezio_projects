import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}



class AuthService extends ChangeNotifier{

  FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;

  bool isLoading = true;

  AuthService(){
    _AuthCheck();
  }

  _AuthCheck(){
    _auth.authStateChanges().listen((User? user) {
      user = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser(){
    user = _auth.currentUser;
    
    notifyListeners();
  }

  registrar(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca');
      } 
      else if (e.code == 'email-already-in-use') {
        AuthException('O email já está em uso');

      }
    } catch (e) {
      throw AuthException('Erro desconhecido');

    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Usuário não encontrado');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta');
      }
    } catch (e) {
      throw AuthException('Erro desconhecido');
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}