import 'package:flutter/material.dart';

class Itens_Ficha extends StatelessWidget {
  final List<String> itens = [
    'Espada Longa',
    'Escudo',
    'Poção de Cura',
    'Armadura de Couro',
    'Arco Longo',
    'Flechas (20)',
    'Tocha',
    'Corda (50 pés)',
    'Kit de Aventureiro'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itens do Personagem'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Color.fromARGB(255, 88, 0, 202),
              Color.fromARGB(255, 47, 0, 109),
              Color.fromARGB(255, 17, 0, 48)
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: itens.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.inventory, size: 40),
                    SizedBox(height: 10),
                    Text(
                      itens[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Itens_Ficha(),
  ));
}
