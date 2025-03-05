import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Atributos extends StatefulWidget {
  const Atributos({super.key, required this.CharacterId});
  final String CharacterId;
  @override
  _AtributosState createState() => _AtributosState();
}

class _AtributosState extends State<Atributos> {
  

  
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, dynamic>? atributos;


  Future<void> fetchatributos() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection('Users')
        .doc('jonathastfm')
        .collection("Personagens")
        .doc('Altair')
        .collection("Ficha")
        .doc('atributos')
        .get();
    setState(() {
      atributos = snapshot.data();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchatributos();
  }


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
                          _buildAtributosTable(atributos),
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

  Widget _buildAtributosTable(Map<String, dynamic>? atributos) {
    
    if (atributos == null) {
      return const CircularProgressIndicator();
    }

    List<Map<String, String>> atributosMesa = [
      {'nome': 'Força', 'valor': atributos!['For'].toString(), 'modificador': ((atributos['For'] - 10) ~/ 2).toString() },
      {'nome': 'Destreza', 'valor': atributos!['Dex'].toString(), 'modificador':((atributos['Dex'] - 10) ~/ 2).toString()},
      {'nome': 'Constituição', 'valor': atributos!['Con'].toString(), 'modificador': ((atributos['Con'] - 10) ~/ 2).toString()},
      {'nome': 'Inteligência', 'valor': atributos!['Int'].toString(), 'modificador': ((atributos['Int'] - 10) ~/ 2).toString()},
      {'nome': 'Sabedoria', 'valor': atributos!['Wis'].toString(), 'modificador': ((atributos['Wis'] - 10) ~/ 2).toString()},
      {'nome': 'Carisma', 'valor': atributos!['Car'].toString(), 'modificador': ((atributos['Car'] - 10) ~/ 2).toString()},
    ];

    return _buildTable(
      'Atributos',
      atributosMesa.map((atributo) {
      String nome = atributo['nome'] ?? '';
      String valor = atributo['valor'] ?? '';
      String modificador = atributo['modificador'] ?? '';
      return _buildTableRowComModificador(nome, valor, modificador);
      }).toList(),
    );
  }

  Widget _buildStatusTable() {
    List<Map<String, String>> status = [
      {'Vida': atributos!['Vida'].toString()},
      {'Vida Temp.': atributos!['VidaTemp'].toString()},
      {'CA': atributos!['CA'].toString()},
      {'Deslocamento': atributos!['Desl'].toString()},
      
    ];

    return _buildTable(
      'Status',
      status.map((stat) {
        String nome = stat.keys.first;
        String valor = stat.values.first;
        return _buildTableRow(nome, valor);
      }).toList(),
    );
  }

  Widget _buildPericiasTable() {
    List<Map<String, String>> pericias = [

      {'Atletismo': atributos!['Atletismo'].toString()},
      {'Acrobacia': atributos!['Acrobacia'].toString()},
      {'Furtividade': atributos!['Furtividade'].toString()},
      {'Prestidigitação': atributos!['Prestidigitação'].toString()},
      {'Arcanismo': atributos!['Arcanismo'].toString()},
      {'História': atributos!['História'].toString()},
      {'Investigação': atributos!['Investigação'].toString()},
      {'Natureza': atributos!['Natureza'].toString()},
      {'Religião': atributos!['Religião'].toString()},
      {'Adestrar Animais': atributos!['Adestrar Animais'].toString()},
      {'Intuição': atributos!['Intuição'].toString()},
      {'Medicina': atributos!['Medicina'].toString()},
      {'Percepção': atributos!['Percepção'].toString()},
      {'Sobrevivência': atributos!['Sobrevivência'].toString()},
      {'Atuação': atributos!['Atuação'].toString()},
      {'Enganação': atributos!['Enganação'].toString()},
      {'Intimidação': atributos!['Intimidação'].toString()},
      {'Persuasão': atributos!['Persuasão'].toString()},
    ];

    return _buildTable(
      'Perícias',
      pericias.map((pericia) {
        String nome = pericia.keys.first;
        String valor = pericia.values.first;
        return _buildTableRow(nome, valor);
      }).toList(),
    );
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
      }).toList(),
    );
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
      }).toList(),
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
              color: Colors.white54,
              width: 1.5,
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
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRowComModificador(
      String atributo, String valor, String modificador) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            atributo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            valor,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.lightGreenAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            modificador,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.orangeAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
