import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'O widget `FittedBox` é usado para redimensionar seu filho de acordo com as '
              'dimensões disponíveis, mantendo a proporção do conteúdo. Por padrão, ele utiliza '
              '`BoxFit.contain`, o que faz com que o conteúdo seja redimensionado para caber '
              'dentro do espaço disponível sem perder a proporção. '
              'No entanto, também existem outras opções de ajuste, como `BoxFit.cover`, '
              'que podem ser configuradas conforme a necessidade. O `FittedBox` é especialmente útil '
              'para garantir que imagens, textos ou outros widgets se adaptem bem a diferentes '
              'tamanhos de tela, evitando que sejam cortados ou esticados de forma desproporcional.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ValueRangeCard(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Para mais informações, confira a documentação oficial do Flutter sobre o FittedBox:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () {
              const url =
                  'https://api.flutter.dev/flutter/widgets/FittedBox-class.html';
              openUrl(url);
            },
            child: const Text(
              'https://api.flutter.dev/flutter/widgets/FittedBox-class.html',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
