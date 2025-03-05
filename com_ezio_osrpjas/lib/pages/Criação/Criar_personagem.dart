import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Criar_Personagem extends StatefulWidget {
  const Criar_Personagem({super.key});

  @override
  State<Criar_Personagem> createState() => _Criar_PersonagemState();
}

class _Criar_PersonagemState extends State<Criar_Personagem> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Var do step atual
  int _currentStep = 0;

  // Var do nome do personagem
  TextEditingController nome = TextEditingController();

  // Var da classe do personagem
  TextEditingController classe = TextEditingController();

  // Var da raça do personagem
  TextEditingController raca = TextEditingController();

  // Var do nível do personagem
  int nivel = 1;

  // Var dos pontos de vida do personagem
  int pontosDeVida = 0;

  // Listas de habilidades, equipamentos e perícias
  List<String> habilidades = ["Força", "Destreza", "Constituição", "Inteligência", "Sabedoria", "Carisma"];
  List<int> valoresHabilidades = [15, 14, 13, 12, 10, 8];
  List<int> valoresHabilidadesEscolhidos = [0, 0, 0, 0, 0, 0];


  // Lista de classes
  List<String> classes = [];

  // Função para buscar classes do Firestore
  void fetchClasses() async {
    QuerySnapshot querySnapshot = await firestore.collection('res').doc("Oficiais").collection("Classes").get();
    setState(() {
      classes = querySnapshot.docs.map((doc) => doc['nome'].toString()).toList();
    });
  }

  // Lista de Raças
  List<String> racas = [];

  // Função para buscar raças do Firestore
  void fetchRacas() async {
    QuerySnapshot querySnapshot = await firestore.collection('res').doc("Oficiais").collection("Raças").get();
    setState(() {
      racas = querySnapshot.docs.map((doc) => doc['nome'].toString()).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    fetchClasses();
    fetchRacas();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Personagem'),
      ),
      body: Stepper(
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 5) {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        steps: <Step>[
          // Nome do personagem
          Step(
            title: const Text("Nome do Personagem"),
            content: SizedBox(
              width: 300,
              child: TextField(
                controller: nome,
                decoration: const InputDecoration(
                  labelText: 'Nome do Personagem',
                ),
                onChanged: (text) {
                  setState(() {
                    text = nome.text;
                  });
                },
              ),
            ),
          ),
          
          
           // Raça do personagem
          Step(
            title: Text("Raça do Personagem"),
            content: SizedBox(
              width: 300,

              child: Scrollable(viewportBuilder: (context, offset) {
                return Column(
                  children: [
                    Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5,
                      borderOnForeground: true,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          raca.text, style: const TextStyle(fontSize: 20)
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Escolha a raça do personagem'),
                              content: Column(
                                children: List.generate(racas.length, (index) {
                                  return ListTile(
                                    title: Text(racas[index]),
                                    onTap: () {
                                      setState(() {
                                        raca.text = racas[index];
                                      });
                                      Navigator.pop(context);
                                    },
                                  );
                                }),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('Escolher Raça'),
                    ),
                  ],
                );
              }),
            ),
          ),
          
          
          // Classe do personagem
          Step(
            title: Text("Classe do Personagem"),
            content: SizedBox(
              width: 300,

              child: Scrollable(viewportBuilder: (context, offset) {
                return Column(
                  children: [
                    Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5,
                      borderOnForeground: true,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          
                          classe.text, style: const TextStyle(fontSize: 20)
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Escolha a classe do personagem'),
                              content: Column(
                                children: List.generate(classes.length, (index) {
                                  return ListTile(
                                    title: Text(classes[index]),
                                    onTap: () {
                                      setState(() {
                                        classe.text = classes[index];
                                      });
                                      Navigator.pop(context);
                                    },
                                  );
                                }),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('Escolher Classe'),
                    ),
                  ],
                );
              }),
            ),
          ),

         
          
          // Habilidades
          Step(
            title: const Text('Atributos'),
            content: Column(
              children: List.generate(habilidades.length, (index) {
  return Row(
    children: [
      Text(habilidades[index], style: const TextStyle(fontSize: 20)),
      const SizedBox(width: 10),
      DropdownButton<String>(
        value: valoresHabilidadesEscolhidos[index] > 0 && valoresHabilidadesEscolhidos[index] <= 20
            ? valoresHabilidadesEscolhidos[index].toString()
            : '1',
        items: List.generate(20, (i) {
          return DropdownMenuItem<String>(
            value: (i + 1).toString(),
            child: Text((i + 1).toString()),
          );
        }),
        onChanged: (value) {
          setState(() {
            valoresHabilidadesEscolhidos[index] = int.parse(value!);
          });
        },
      ),
    ],
  );
}),
            ),
          ),
          
          // Finalizar
          Step(
            title: const Text('Finalizar'),
            content: Column(
              children: [
                Text('Nome: ${nome.text}'),
                Text('Raça: ${raca.text}'),
                Text('Classe: ${classe.text}'),
                Text('Nível: $nivel'),
                Text('Pontos de Vida: $pontosDeVida'),
                Text('Habilidades:'),
                Column(
                  children: List.generate(habilidades.length, (index) {
                    return Text('${habilidades[index]}: ${valoresHabilidades[index]}');
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}