import 'package:flutter/material.dart';

import 'value_range_card.dart';

class FittedBoxExamplesPage extends StatelessWidget {
  const FittedBoxExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplos de FittedBox'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ValueRangeCard(),
        ],
      ),
    );
  }
}
