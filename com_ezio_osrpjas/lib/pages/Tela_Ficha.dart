import 'package:flutter/material.dart';

class Tela_Ficha extends StatelessWidget {
  const Tela_Ficha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  // Tabela de Atributos do Personagem
                  Table(
                    border: TableBorder.all(color: Colors.white),
                    children: [
                      _buildTableRow('Força', '18'),
                      _buildTableRow('Destreza', '16'),
                      _buildTableRow('Constituição', '15'),
                      _buildTableRow('Inteligência', '14'),
                      _buildTableRow('Sabedoria', '12'),
                      _buildTableRow('Carisma', '10'),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 20), // Espaçamento entre as tabelas
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  // Nova Tabela com Vida, Armadura e Deslocamento
                  Table(
                    border: TableBorder.all(color: Colors.white),
                    children: [
                      _buildTableRow('Vida', '50'),
                      _buildTableRow('Armadura', '18'),
                      _buildTableRow('Deslocamento', '9m'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(String atributo, String valor) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            atributo,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            valor,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
