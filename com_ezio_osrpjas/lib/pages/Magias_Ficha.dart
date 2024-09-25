import 'package:flutter/material.dart';

class Magias_Ficha extends StatelessWidget {
  final List<String> magias = [
    'Bola de Fogo',
    'Mísseis Mágicos',
    'Cura Leve',
    'Escudo Arcano',
    'Invisibilidade'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magias do Personagem'),
      ),
      body: ListView.builder(
        itemCount: magias.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(magias[index]),
            leading: Icon(Icons.auto_awesome),
            onTap: () {
              // Ação ao clicar na magia
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(magias[index]),
                  content: Text('Detalhes da magia ${magias[index]}'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Fechar'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Magias_Ficha(),
  ));
}
