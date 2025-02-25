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

/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

 

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
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
*/



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CharacterSheet(),
    );
  }
}

class CharacterSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.purple,
              child: Center(
                child: Text(
                  'yaris',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            CircleAvatar(radius: 40, backgroundColor: Colors.grey),
            SizedBox(height: 10),
            Text('Artificer 6'),
            Text('AC: 19'),
            Text('BP: +3'),
            Text('Deslocamento: 9m'),
            Text('Init: 2'),
            SizedBox(height: 20),
            buildSectionHeader('Atributos'),
            buildAttributes(),
            buildSectionHeader('Salvaguardas'),
            buildSaves(),
            buildSectionHeader('PerÃ­cias'),
            buildSkills(),
          ],
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      color: Colors.grey[400],
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildAttributes() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        buildAttributeBox('For', '+0', '11'),
        buildAttributeBox('Dex', '+2', '14'),
        buildAttributeBox('Con', '+2', '15'),
        buildAttributeBox('Int', '+4', '18'),
        buildAttributeBox('Sab', '-1', '9'),
        buildAttributeBox('Car', '+1', '13'),
      ],
    );
  }

  Widget buildSaves() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        buildAttributeBox('For', '+0', ''),
        buildAttributeBox('Dex', '+2', ''),
        buildAttributeBox('Con', '+5', ''),
        buildAttributeBox('Int', '+7', ''),
        buildAttributeBox('Wis', '-1', ''),
        buildAttributeBox('Car', '+1', ''),
      ],
    );
  }

  Widget buildSkills() {
    List<String> skills = [
      'Acrobatics', 'Animal Handling', 'Arcana', 'Athletics',
      'Deception', 'History', 'Insight', 'Intimidation',
      'Medicine', 'Nature', 'Perception', 'Performance',
      'Persuasion', 'Religion', 'Sleight of Hand',
      'Stealth', 'Survival'
    ];
    return Column(
      children: skills.map((skill) => buildSkillRow(skill)).toList(),
    );
  }

  Widget buildSkillRow(String skill) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(skill),
          Icon(Icons.circle, size: 16, color: Colors.black54),
        ],
      ),
    );
  }

  Widget buildAttributeBox(String label, String modifier, String value) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(modifier, style: TextStyle(fontSize: 16)),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}