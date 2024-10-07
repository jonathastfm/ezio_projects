import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_ezio_osrpjas/firebase_options.dart';
import 'package:com_ezio_osrpjas/pages/Ficha/Atributos.dart';
import 'package:com_ezio_osrpjas/pages/Ficha/Ficha.dart';
import 'package:com_ezio_osrpjas/pages/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  firestore
        .collection('Users')
        .doc('jonathastfm')
        .collection("Personagens")
        .doc('Altair')
        .collection("Ficha")
        .doc('atributos')
        .update({
      'For': 12,
      'Dex': 13,
      'Con': 18,
      'Int': 20,
      'Wis': 14,
      'Car': 10,
        });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
