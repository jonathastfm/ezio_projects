import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Creating_Classes extends StatefulWidget {
  const Creating_Classes({super.key});

  @override
  

  State<Creating_Classes> createState() => _Creating_ClassesState();
}

class _Creating_ClassesState extends State<Creating_Classes> {

  FirebaseFirestore firestore = FirebaseFirestore.instance; 

  //Var do step atual
  int _currentStep = 0;

  //Var do nome da classe
  TextEditingController nome = TextEditingController();
  
  //valor do dado de vida
  int vida = 0;

 //Listas de armas, armaduras e ferramentas 
  List<String> Armaduras = ["Armaduras leves", "Armaduras medias", "Armaduras pesadas", "Escudos"];
  
  List<String> Armas = ["Armas simples", "Armas marciais", "Armas de fogo", "Arco e flecha","4 Azagaias", "Adaga", "Bestas",
                        "Cajado", "Dardos", "Espada curta", "Espada longa", "Espada larga","Funda",
                         "Lança", "Maça", "Machado", "Martelo"];  

  List<String> Ferramentas = [
                              "Bolsa de componentes", "Foco arcano",
                              "Ferramentas de ladrão", "Ferramentas de artesão", "Ferramentas de herbalista",
                              "Ferramentas de cozinheiro", "Ferramentas de ferreiro", "Grimorio",  "Kit Medico", "Instrumento Musical",
                              "Pacote de Explorador", "Pacote de Aventureiro", "Pacote de Diplomata", "Pacote de Artista",
                              "Pacote de Sacerdote", "Pacote de Estudioso",
                              ];
  
  //Listas de armas, armaduras e ferramentas escolhidas
  List<String> Armaduras_escolhidas = [];
  List<String> Armas_escolhidas = [];
  List<String> Ferramentas_escolhidas = [];

  //Pericias
  List<String> Pericias = [
                          "Acrobacia", "Arcanismo", "Atletismo", "Blefar", "Furtividade", "Historia",
                          "Intimidação", "Intuição", "Investigação", "Lidar com animais", "Medicina",
                          "Natureza", "Percepção", "Persuasão", "Prestidigitação", "Religião",
                          "Sobrevivência"
                          ];
  List<String> Pericias_escolhidas = [];

  List<String> Salvaguardas = ["Força", "Destreza", "Constituição", "Inteligência", "Sabedoria", "Carisma"];
  List<String> Salvaguardas_escolhidas = [];

  
  
  List<String> Equipamentos_escolhidos_armaduras = [];
  List<String> Equipamentos_escolhidos_armas = [];
  List<String> Equipamentos_escolhidos_ferramentas = [];
  List<String> Equipamentos_escolhidos_ouro = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating Classes'),
        
      ),
      body: Stepper(
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        
        currentStep: _currentStep,
        
        onStepContinue: () {
          if (_currentStep < 6) {
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

          //Nome da classe
          Step(
            title: Text("Nome da Classe"), 
            content: SizedBox(
              width: 300,
              child: TextField(
                controller: nome,
                decoration: InputDecoration(
                  labelText: 'Nome da Classe',
                ),
                onChanged: (text) {
                  setState(() {
                    text = nome.text;
                  });
                },
              ),
            ),
          ),

          //Dados de vida
          Step(
            title: const Text('Dados de vida'),
            content: Row(
              children: [
                Text("Dado de Vida: ", style: TextStyle(fontSize: 20),),
                DropdownButton<int>(
                  value: vida!=0?vida:null,
                  items: List.generate(4, (index) => (index*2)+6).map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (int? value) {
                    setState(() {
                      
                      vida=value!;
                    });
                  },
                ),
              ],
            ),
            
          ),
          
          //Proficiencias
          Step(
            title: const Text('Proficiencias'),
            content: Column(
              children: [

                //Armaduras
                Text("Armaduras",   style: TextStyle(fontSize: 20),),
                
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: Armaduras.length,
                  itemBuilder: (context, index){
                    return CheckboxListTile(
                      title: Text(Armaduras[index]),
                      value: Armaduras_escolhidas.contains(Armaduras[index]),
                      onChanged: (value){
                        setState(() {
                          if(value == true){
                              Armaduras_escolhidas.add(Armaduras[index]);
                          }
                          else{
                              Armaduras_escolhidas.remove(Armaduras[index]);
                          }
                        });
                      },
                    );
                  },
                ), 
                //Armas
                Text("Armas",   style: TextStyle(fontSize: 20),),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: Armas.length,
                  itemBuilder: (context, index){
                    return CheckboxListTile(
                      title: Text(Armas[index]),
                      value: Armas_escolhidas.contains(Armas[index]),
                      onChanged: (value){
                        setState(() {
                          if(value == true){
                              Armas_escolhidas.add(Armas[index]);
                          }
                          else{
                              Armas_escolhidas.remove(Armas[index]);
                          }
                        });
                      },
                    );
                  },
                ),

                //Ferramentas  
                Text("Ferramentas",   style: TextStyle(fontSize: 20),),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: Ferramentas.length,
                  itemBuilder: (context, index){
                    return CheckboxListTile(
                      title: Text(Ferramentas[index]),
                      value: Ferramentas_escolhidas.contains(Ferramentas[index]),
                      onChanged: (value){
                        setState(() {
                          if(value == true){
                              Ferramentas_escolhidas.add(Ferramentas[index]);
                          }
                          else{
                              Ferramentas_escolhidas.remove(Ferramentas[index]);
                          }
                        });
                      },
                    );
                  },
                ),


                   
              ],
            ),
          ),    
          
          //Pericias
          Step(
            title: Text("Pericias"), 

            content: Column(
              children: [

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: Pericias.length,
                  itemBuilder: (context, index){
                    return CheckboxListTile(
                      title: Text(Pericias[index]),
                      value: Pericias_escolhidas.contains(Pericias[index]),
                      onChanged: (value){
                        setState(() {
                          if(value == true){
                              Pericias_escolhidas.add(Pericias[index]);
                          }
                          else{
                              Pericias_escolhidas.remove(Pericias[index]);
                          }
                        });
                      },
                    );
                  },
                ), 
              ],
            ),
          
          
          ),

          //Salvaguardas
          Step(
            title: Text("Salvaguardas"), 

            content: Column(
              children: [

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: Salvaguardas.length,
                  itemBuilder: (context, index){
                    return CheckboxListTile.adaptive(
                      title: Text(Salvaguardas[index]),
                      value: Salvaguardas_escolhidas.contains(Salvaguardas[index]),
                      onChanged: (value){
                        setState(() {
                          if(value == true){
                              Salvaguardas_escolhidas.add( Salvaguardas[index]);
                          }
                          else{
                              Salvaguardas_escolhidas.remove(Salvaguardas[index]);
                          }
                        });
                      },
                    );
                  },
                ), 
              ],
            ),
          
          
          ),
          
          //Equipamentos iniciais
          Step(
            title: Text("Equipamentos iniciais"), 

            content: Column(
              children: [
                //Armaduras
                Text("Armaduras",   style: TextStyle(fontSize: 20),),
                
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  shrinkWrap: true,
                  itemCount: Armaduras.length,
                  itemBuilder: (context, index){
                    return Column(
                      children: [

                        Text(Armaduras[index]),
                        Checkbox(
                          
                          value: Equipamentos_escolhidos_armaduras.contains(Armas[index]),
                          onChanged: (value){
                            setState(() {
                              if(value == true){
                                  Equipamentos_escolhidos_armaduras.add(Armas[index]);
                              }
                              else{
                                  Equipamentos_escolhidos_armaduras.remove(Armas[index]);
                              }
                            });
                          },
                        ),
                      ],
                    );
                  },
                ), 
                //Armas
                  Text("Armas",   style: TextStyle(fontSize: 20),),

                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    shrinkWrap: true,
                    itemCount: Armas.length,
                    itemBuilder: (context, index){
                      return Column(
                        children: [

                          Text(Armas[index]),
                          Checkbox(
                            
                            value: Equipamentos_escolhidos_armas.contains(Armas[index]),
                            onChanged: (value){
                              setState(() {
                                if(value == true){
                                    Equipamentos_escolhidos_armas.add(Armas[index]);
                                }
                                else{
                                    Equipamentos_escolhidos_armas.remove(Armas[index]);
                                }
                              });
                            },
                          ),
                        ],
                      );
                    },
                  ),

                //Ferramentas  
                Text("Ferramentas",   style: TextStyle(fontSize: 20),),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: Ferramentas.length,
                  itemBuilder: (context, index){
                    return CheckboxListTile(
                      title: Text(Ferramentas[index]),
                      value: Equipamentos_escolhidos_ferramentas.contains(Ferramentas[index]),
                      onChanged: (value){
                        setState(() {
                          if(value == true){
                              Equipamentos_escolhidos_ferramentas.add(Ferramentas[index]);
                          }
                          else{
                              Equipamentos_escolhidos_ferramentas.remove(Ferramentas[index]);
                          }
                        });
                      },
                    );
                  },
                ),

                
              ],
            ),
          
          
          ),

          //Finalizar
          Step(
            
            title: const Text('Finalizar'),
            content: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    firestore.collection('Classes').doc(nome.text).collection("Criacao").doc("Vida").set({
                      "Dado de vida": vida,
                      "dado de vida por nivel": ((vida/2)+1),
                      "pv inicial": vida
                    });
                    
                    firestore.collection('Classes').doc(nome.text).collection("Criacao").doc("Proficiencias").set({
                      "Armaduras": Armaduras_escolhidas,
                      "Armas": Armas_escolhidas,
                      "Ferramentas": Ferramentas_escolhidas,
                      "Pericias": Pericias_escolhidas,
                      "Salvaguardas": Salvaguardas_escolhidas,
                    });

                    firestore.collection('Classes').doc(nome.text).collection("Criacao").doc("Equipamentos Iniciais").set({
                      "Armaduras": Equipamentos_escolhidos_armaduras,
                      "Ferramentas": Equipamentos_escolhidos_ferramentas,
                      "Armas": Equipamentos_escolhidos_armas
                    });

                    Armaduras_escolhidas = [];
                    Armas_escolhidas = [];
                    Ferramentas_escolhidas = [];

                    Pericias_escolhidas = [];

                    Equipamentos_escolhidos_armaduras = [];
                    Equipamentos_escolhidos_armas = [];
                    Equipamentos_escolhidos_ferramentas = [];
                    Equipamentos_escolhidos_ouro = [];

                    _currentStep = 0;



                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        
        ]
      )
    );
  }
}