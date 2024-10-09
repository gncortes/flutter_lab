import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Inicial'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.fit_screen, color: Colors.blue),
            title: const Text('Exemplos de FittedBox'),
            subtitle: const Text(
                'Veja como usar o FittedBox em diferentes situações.'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, '/fittedBoxExamples');
            },
          ),
        ],
      ),
    );
  }
}
