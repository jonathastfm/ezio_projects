import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_ezio_osrpjas/pages/Ficha/Habilidades.dart';
import 'package:com_ezio_osrpjas/pages/Ficha/Itens.dart';
import 'package:com_ezio_osrpjas/pages/Ficha/Magias.dart';
import 'package:flutter/material.dart';
import 'package:com_ezio_osrpjas/pages/Ficha/Atributos.dart';

class Header extends StatefulWidget {
  final String CharacterId;

  Header({Key? key, required this.CharacterId}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, dynamic>? info;

  @override
  void initState() {
    super.initState();
    fetchInfo();
  }

  Future<void> fetchInfo() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection('Users')
        .doc('jonathastfm')
        .collection("Personagens")
        .doc('Altair')
        .collection("Ficha")
        .doc('info')
        .get();
    setState(() {
      info = snapshot.data();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informações Básicas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nome: ${info?['nome']?.toString() ?? 'Loading...'}',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(
                              255, 0, 0, 0), // Texto cinza claro
                        ),
                      ),
                      Text(
                        'Raça: ${info?['raca']?.toString() ?? 'Loading...'}',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey[800], // Cor escura para borda
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/imagem_padrao.png'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Classe: ${info?['classe']?.toString() ?? 'Loading...'}',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        'Nível: ${info?['nivel']?.toString() ?? 'Loading...'}',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.grey[900],
                bottom: const TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.person, color: Colors.white),
                    ),
                    Tab(
                      icon: Icon(Icons.sports_mma_rounded, color: Colors.white),
                    ),
                    Tab(
                      icon:
                          Icon(Icons.auto_awesome_rounded, color: Colors.white),
                    ),
                    Tab(
                      icon: Icon(Icons.shield, color: Colors.white),
                    ),
                  ],
                ),
                title: const Text(
                  'Ficha do Personagem',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: TabBarView(
                children: [
                  Atributos(CharacterId: widget.CharacterId),
                  Habilidades_Ficha(),
                  Magias_Ficha(),
                  Itens_Ficha(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
