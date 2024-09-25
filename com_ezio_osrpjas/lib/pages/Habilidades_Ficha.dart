import 'package:flutter/material.dart';

class Habilidades_Ficha extends StatelessWidget {
  final List<String> habilidades = [
    'Ataque Rápido',
    'Golpe Forte',
    'Chute Giratório',
    'Lança de Fogo',
    'Tiro de Gelo'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habilidades de Ataque'),
      ),
      body: ListView.builder(
        itemCount: habilidades.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.flash_on),
              title: Text(habilidades[index]),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Habilidades_Ficha(),
  ));
}
