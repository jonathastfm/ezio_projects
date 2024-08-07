import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                widget.firestore.collection('Classes').doc("Artifice").collection("Criacao").doc("Equipamento inicial").set({
                  "Armas": ["Duas armas simples", "Uma besta leve e 20 virotes"],
                  "Armadura": "Armadura de couro ou uma brunea",
                  "Ferramentas": ["ferramentas de ladrão", "pacote de explorador"],
                  "Ouro": 100
                });
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
