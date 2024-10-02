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
                          _buildAtributosTable(),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildStatusTable(),
                    ),
                  ],
                ),
                // linha dividindo os trem
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildPericiasTable(),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: [
                          _buildTesteTable(),
                          const SizedBox(height: 20),
                          _buildHabilidadesTable(),
                        ],
                      ),
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

  Widget _buildAtributosTable() {
    List<Map<String, String>> atributos = [
      {'Força': '13'},
      {'Destreza': '16'},
      {'Constituição': '15'},
      {'Inteligência': '14'},
      {'Sabedoria': '11'},
      {'Carisma': '9'},
    ];

    return _buildTable(
        'Atributos',
        atributos.map((atributo) {
          String nome = atributo.keys.first;
          String valor = atributo.values.first;
          return _buildTableRow(nome, valor);
        }).toList());
  }

  Widget _buildStatusTable() {
    List<Map<String, String>> status = [
      {'Vida': '50'},
      {'Vida Temp.': '70'},
      {'CA': '18'},
      {'Deslocamento': '9m'},
    ];

    return _buildTable(
        'Status',
        status.map((stat) {
          String nome = stat.keys.first;
          String valor = stat.values.first;
          return _buildTableRow(nome, valor);
        }).toList());
  }

  // Tabela de Perícias
  Widget _buildPericiasTable() {
    List<Map<String, String>> pericias = [
      {'Atletismo': '8'},
      {'Acrobacia': '7'},
      {'Furtividade': '6'},
      {'Prestidigitação': '5'},
      {'Arcanismo': '4'},
      {'História': '3'},
      {'Investigação': '2'},
      {'Natureza': '1'},
      {'Religião': '0'},
      {'Adestrar Animais': '2'},
      {'Intuição': '4'},
      {'Medicina': '6'},
      {'Percepção': '5'},
      {'Sobrevivência': '7'},
      {'Atuação': '6'},
      {'Enganação': '8'},
      {'Intimidação': '9'},
      {'Persuasão': '10'},
    ];

    return _buildTable(
        'Perícias',
        pericias.map((pericia) {
          String nome = pericia.keys.first;
          String valor = pericia.values.first;
          return _buildTableRow(nome, valor);
        }).toList());
  }

  Widget _buildTesteTable() {
    List<Map<String, String>> testes = [
      {'Força': '1'},
      {'Destreza': '3'},
      {'Constituição': '2'},
      {'Inteligencia': '2'},
      {'Sabedoria': '0'},
      {'Carisma': '-1'},
    ];

    return _buildTable(
        'Salvaguardas',
        testes.map((teste) {
          String nome = teste.keys.first;
          String valor = teste.values.first;
          return _buildTableRow(nome, valor);
        }).toList());
  }

  Widget _buildHabilidadesTable() {
    List<Map<String, String>> habilidades = [
      {'teste': '???'},
      {'teste': '???'},
      {'teste': '???'},
      {'teste': '???'},
    ];

    return _buildTable(
        'Proficiências',
        habilidades.map((habilidade) {
          String nome = habilidade.keys.first;
          String valor = habilidade.values.first;
          return _buildTableRow(nome, valor);
        }).toList());
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
