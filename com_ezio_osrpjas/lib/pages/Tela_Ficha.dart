import 'package:flutter/material.dart';

class Tela_Ficha extends StatelessWidget {
  const Tela_Ficha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 88, 0, 202),
                Color.fromARGB(255, 47, 0, 109),
                Color.fromARGB(255, 17, 0, 48),
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTable('Atributos', [
                            _buildTableRow('Força', '18'),
                            _buildTableRow('Destreza', '16'),
                            _buildTableRow('Constituição', '15'),
                            _buildTableRow('Inteligência', '14'),
                            _buildTableRow('Sabedoria', '12'),
                            _buildTableRow('Carisma', '10'),
                          ]),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildTable('Status', [
                        _buildTableRow('Vida', '50'),
                        _buildTableRow('CA', '18'),
                        _buildTableRow('Deslocamento', '9m'),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildTable('Perícias', [
                        _buildTableRow('Atletismo', '8'),
                        _buildTableRow('Acrobacia', '7'),
                        _buildTableRow('Furtividade', '6'),
                        _buildTableRow('Prestidigitação', '5'),
                        _buildTableRow('Arcanismo', '4'),
                        _buildTableRow('História', '3'),
                        _buildTableRow('Investigação', '2'),
                        _buildTableRow('Natureza', '1'),
                        _buildTableRow('Religião', '0'),
                        _buildTableRow('Adestrar Animais', '2'),
                        _buildTableRow('Intuição', '4'),
                        _buildTableRow('Medicina', '6'),
                        _buildTableRow('Percepção', '5'),
                        _buildTableRow('Sobrevivência', '7'),
                        _buildTableRow('Atuação', '6'),
                        _buildTableRow('Enganação', '8'),
                        _buildTableRow('Intimidação', '9'),
                        _buildTableRow('Persuasão', '10'),
                      ]),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildTable('Teste', [
                        _buildTableRow('Teste', '1'),
                        _buildTableRow('Teste', '2'),
                        _buildTableRow('Teste', '16'),
                        _buildTableRow('Teste', '3'),
                        _buildTableRow('Teste', '11'),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTable(String title, List<TableRow> rows) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Table(
            border: TableBorder.all(
              color: Colors.white,
              width: 2,
            ),
            children: rows,
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRow(String atributo, String valor) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            atributo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            valor,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
