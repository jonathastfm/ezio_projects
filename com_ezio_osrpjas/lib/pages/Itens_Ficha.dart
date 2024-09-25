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
      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.inventory),
            title: Text(itens[index]),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Itens_Ficha(),
  ));
}
