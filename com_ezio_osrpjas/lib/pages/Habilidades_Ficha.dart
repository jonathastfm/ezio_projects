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
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
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
          child: ListView.builder(
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
        ),
      ),
      appBar: AppBar(
        title: Text('Habilidades de Ataque'),
      ),
      // body: ListView.builder(
      //   itemCount: habilidades.length,
      //   itemBuilder: (context, index) {
      //     return Card(
      //       child: ListTile(
      //         leading: Icon(Icons.flash_on),
      //         title: Text(habilidades[index]),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Habilidades_Ficha(),
  ));
}
