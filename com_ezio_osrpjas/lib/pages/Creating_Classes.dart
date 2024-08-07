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
  int vida = 0;

  List<String> Armaduras = ["Armaduras leves", "Armaduras medias", "Armaduras pesadas", "Escudos"];

  
  List<String> Proficiencias_escolhidas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating Classes'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
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
          
          Step(
            title: const Text('Proficiencias'),
            content: Column(
              children: [
                Text("Armaduras",   style: TextStyle(fontSize: 20),),
                
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: Armaduras.length,
                  itemBuilder: (context, index){
                    return CheckboxListTile(
                      title: Text(Armaduras[index]),
                      value: Proficiencias_escolhidas.contains(Armaduras[index]),
                      onChanged: (value){
                        setState(() {
                          if(value == true){
                              Proficiencias_escolhidas.add(Armaduras[index]);
                          }
                          else{
                              Proficiencias_escolhidas.remove(Armaduras[index]);
                          }
                        });
                      },
                    );
                  },
                ),      
              ],
            ),
          ),    
        ]
      )
    );
  }
}