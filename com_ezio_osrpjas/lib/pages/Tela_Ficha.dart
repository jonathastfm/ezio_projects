import 'package:flutter/material.dart';

class Tela_Ficha extends StatelessWidget {
  const Tela_Ficha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Ficha'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
