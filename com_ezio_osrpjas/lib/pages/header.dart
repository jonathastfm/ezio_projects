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
                'Área para info básicas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
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
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        'Raça: [?? raça ??]',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                  //imagem do personagem
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color.fromARGB(164, 64, 5, 119),
                    backgroundImage: AssetImage('assets/imagem_padrao.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Classe: [?? classe ??]',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        'Nível: [?? nível ??]',
                        style: TextStyle(fontSize: 16, color: Colors.black),
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
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.person),
                    ),
                    Tab(
                      icon: Icon(Icons.sports_mma_rounded),
                    ),
                    Tab(
                      icon: Icon(Icons.auto_awesome_rounded),
                    ),
                    Tab(
                      icon: Icon(Icons.shield),
                    ),
                  ],
                ),
                title: const Text('Ficha'),
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
