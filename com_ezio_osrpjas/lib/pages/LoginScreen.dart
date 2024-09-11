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
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                widget.firestore.collection('Classes').doc("Artifice").collection("Criacao").doc("Equipamento inicial").set({
                  "Armas": ["Duas armas simples", "Uma besta leve e 20 virotes"],
                  "Armadura": "Armadura de couro ou uma brunea",
                  "Ferramentas": ["ferramentas de ladrão", "pacote de explorador"],
                  "Ouro": 100
                });
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
