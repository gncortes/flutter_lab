import 'package:flutter/material.dart';
import 'package:flutter_labs/utils/context.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.homeTitle),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(context.tr.homeFittedBoxExamplesTitle),
            subtitle: Text(context.tr.homeFittedBoxExamplesSubtitle),
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
