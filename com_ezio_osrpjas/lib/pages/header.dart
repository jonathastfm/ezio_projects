import 'package:com_ezio_osrpjas/pages/Habilidades_Ficha.dart';
import 'package:com_ezio_osrpjas/pages/Itens_Ficha.dart';
import 'package:com_ezio_osrpjas/pages/Magias_Ficha.dart';
import 'package:flutter/material.dart';
import 'package:com_ezio_osrpjas/pages/Tela_Ficha.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

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
                        'Nome: [?? nome ??]',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(
                              255, 0, 0, 0), // Texto cinza claro
                        ),
                      ),
                      Text(
                        'Raça: [?? raça ??]',
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
                        'Classe: [?? classe ??]',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        'Nível: [?? nível ??]',
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
                  const Tela_Ficha(),
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
