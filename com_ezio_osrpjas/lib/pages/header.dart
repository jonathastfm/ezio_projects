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
                  color: Colors.black, // Cor preta
                ),
              ),
              SizedBox(height: 16), // Espaço entre o título e as informações
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Espaço entre os dois lados
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nome: [?? nome ??]',
                        style: TextStyle(
                            fontSize: 16, color: Colors.black), // Cor preta
                      ),
                      Text(
                        'Raça: [?? raça ??]',
                        style: TextStyle(
                            fontSize: 16, color: Colors.black), // Cor preta
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Classe: [?? classe ??]',
                        style: TextStyle(
                            fontSize: 16, color: Colors.black), // Cor preta
                      ),
                      Text(
                        'Nível: [?? nível ??]',
                        style: TextStyle(
                            fontSize: 16, color: Colors.black), // Cor preta
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
