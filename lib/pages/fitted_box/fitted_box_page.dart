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
              'O widget FittedBox é usado para redimensionar seu filho de acordo '
              'com as dimensões disponíveis. Ele mantém a proporção do conteúdo '
              'e ajusta o tamanho de forma automática, de acordo com a configuração '
              'do parâmetro "fit" escolhido, como BoxFit.contain ou BoxFit.cover. '
              'Isso é útil para garantir que imagens, textos ou outros widgets se adaptem '
              'bem a diferentes tamanhos de tela, sem serem cortados ou esticados '
              'de maneira desproporcional.',
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
