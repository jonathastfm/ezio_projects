import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Creating_Classes extends StatefulWidget {
  const Creating_Classes({super.key});

  @override
  

  State<Creating_Classes> createState() => _Creating_ClassesState();
}

class _Creating_ClassesState extends State<Creating_Classes> {

  FirebaseFirestore firestore = FirebaseFirestore.instance; 

  int _currentStep = 0;

  TextEditingController nome = TextEditingController();

  //valor do dado de vida
  int vida = 0;

 //Listas de armas, armaduras e ferramentas 
  List<String> Armaduras = ["Armaduras leves", "Armaduras medias", "Armaduras pesadas", "Escudos"];
  
  List<String> Armas = ["Armas simples", "Armas marciais", "Armas de fogo", "Arco e flecha", "Bestas",
                        "Cajado", "Dardos", "Espada curta", "Espada longa", "Espada larga","Funda",
                         "Lança", "Maça", "Machado", "Martelo"];  

  List<String> Ferramentas = ["Ferramentas de ladrão", "Ferramentas de artesão", "Ferramentas de herbalista", "Ferramentas de cozinheiro", "Ferramentas de ferreiro",  "Kit Medico", "Instrumento Musical"];
  
  //Listas de armas, armaduras e ferramentas escolhidas
  List<String> Armaduras_escolhidas = [];
  List<String> Armas_escolhidas = [];
  List<String> Ferramentas_escolhidas = [];

  //Pericias
  List<String> Pericias = ["Acrobacia", "Arcanismo", "Atletismo", "Blefar", "Furtividade", "Historia", "Intimidação", "Intuição", "Investigação", "Lidar com animais", "Medicina", "Natureza", "Percepção", "Persuasão", "Prestidigitação", "Religião", "Sobrevivência"];
  List<String> Pericias_escolhidas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creating Classes'),
        
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 4) {
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

          Step(
            title: const Text("Nome da Classe"), 
            content: SizedBox(
              width: 300,
              child: TextField(
                controller: nome,
                decoration: const InputDecoration(
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

          Step(
            title: const Text('Dados de vida'),
            content: Row(
              children: [
                const Text("Dado de Vida: ", style: TextStyle(fontSize: 20),),
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
          
          Step(
            title: const Text('Proficiencias'),
            content: Column(
              children: [

                //Armaduras
                const Text("Armaduras",   style: TextStyle(fontSize: 20),),
                
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
                const Text("Armas",   style: TextStyle(fontSize: 20),),

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
                const Text("Ferramentas",   style: TextStyle(fontSize: 20),),

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

          Step(
            title: const Text("Pericias"), 

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


          Step(
            title: const Text('Finalizar'),
            content: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    firestore.collection('Classes').doc(nome.text).collection("Criacao").doc("vida").set({
                      "Dado de vida": vida,
                      "dado de vida por nivel": ((vida/2)+1),
                      "pv inicial": vida
                    });
                    
                    firestore.collection('Classes').doc(nome.text).collection("Criacao").doc("Proficiencias").set({
                      "Armaduras": Armaduras_escolhidas,
                      "Armas": Armas_escolhidas,
                      "Ferramentas": Ferramentas_escolhidas
                    });

                    firestore.collection("Classes").doc(nome.text).collection("Criacao").doc("Prericias").set({
                      "Pericias": Pericias_escolhidas
                    });
                  },
                  child: const Text('Finalizar'),
                ),
              ],
            ),
          ),
        
        ]
      )
    );
  }
}