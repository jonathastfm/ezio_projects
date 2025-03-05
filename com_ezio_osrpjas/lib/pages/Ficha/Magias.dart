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
        ),
        child: ListView.builder(
          itemCount: magias.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                magias[index],
                style: TextStyle(
                    color: Colors
                        .white), // Ajustando a cor do texto para ficar visível
              ),
              leading: Icon(Icons.auto_awesome,
                  color: Colors.white), // Cor do ícone ajustada
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
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Magias_Ficha(),
  ));
}
