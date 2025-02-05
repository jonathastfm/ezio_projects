// Version: 1.0
import 'package:com_ezio_osrpjas/pages/Classes/personagens.dart';
import 'package:com_ezio_osrpjas/pages/Cria%C3%A7%C3%A3o/Creating_Classes.dart';
import 'package:com_ezio_osrpjas/pages/Cria%C3%A7%C3%A3o/Criar_personagem.dart';
import 'package:flutter/material.dart';
import 'package:com_ezio_osrpjas/services/fichaClass.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}



class _MenuPageState extends State<MenuPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Personagens'),
            Tab(text: 'Criação'),
            Tab(text: 'PDFs'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PersonagensTab(),
          CriacaoTab(),
          PdfsTab(),
        ],
      ),
    );
  }
}

class PersonagensTab extends StatelessWidget {

  final ListaPersonagens = [
    Personagem(1, 'Ezio', 21, 'Ladino', 1),
    Personagem(2, 'Altair', 25, 'Artifice', 1),
    Personagem(3, 'Connor', 20, 'Assassino', 1),
    Personagem(4, 'Edward', 30, 'Pirata', 1),
    Personagem(5, 'Shay', 35, 'Templário', 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Seus Personagens', style: TextStyle(fontSize: 24)),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: ListaPersonagens.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.deepPurple[100],
                  shadowColor: Colors.deepPurple,
                  child: ListTile(
                    title: Text(ListaPersonagens[index].nome),
                    subtitle: Text(ListaPersonagens[index].classe),
                    trailing: Text('Nível: ${ListaPersonagens[index].nivel}'),
                    onTap: () {
                      ListaPersonagens[index].subirNivel();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CriacaoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Criação de Personagens
          Text('Criação de Personagens', style: TextStyle(fontSize: 24)),

          FilledButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Criar_Personagem()));
            }, 
            child: Text('Criar Personagem')
          ),

          FilledButton(onPressed: (){}, child: Text('Criar NPC')),

          //Criação de Mecanicas
          Text("Criar Mecanicas", style: TextStyle(fontSize: 24)),

          FilledButton(
            onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Criar_Classe()));
            }, 
            child: Text('Criar Classe')),
          
          FilledButton(
            onPressed: (){}, child: Text('Criar Raça')),
        ],
      ),
    );
  }
}

class PdfsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('PDFs'),
    );
  }
}