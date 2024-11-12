import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_ezio_osrpjas/firebase_options.dart';
import 'package:com_ezio_osrpjas/pages/Ficha/Atributos.dart';
import 'package:com_ezio_osrpjas/pages/Ficha/Ficha.dart';
import 'package:com_ezio_osrpjas/pages/Login_Page.dart';
import 'package:com_ezio_osrpjas/widgets/auth_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:com_ezio_osrpjas/services/AuthService.dart'; // Import the AuthService

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

 

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Authservice()),
        // Add your providers here
      ],
      child: const MyApp(),
    ),
  );
  
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
      home: AuthCheck(),
    );
  }
}
