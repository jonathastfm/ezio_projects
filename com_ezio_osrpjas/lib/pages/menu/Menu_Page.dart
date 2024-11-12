import 'package:flutter/material.dart';

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
            Tab(text: 'Perfil'),
            Tab(text: 'PDFs'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PersonagensTab(),
          PerfilTab(),
          PdfsTab(),
        ],
      ),
    );
  }
}

class PersonagensTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Todos os Personagens'),
    );
  }
}

class PerfilTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Perfil'),
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