import "package:com_ezio_osrpjas/pages/Tela_Ficha.dart";
import "package:flutter/material.dart";

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.person),
                ),
                Tab(
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
            title: const Text('Ficha'),
          ),
          body: TabBarView(
            children: [
              Container(child: Tela_Ficha()),
              Container(
                color: Colors.green,
                child: const Icon(Icons.person),
              ),
              Container(
                color: Colors.red,
                child: const Icon(Icons.settings),
              ),
            ],
          )),
    );
  }
}
