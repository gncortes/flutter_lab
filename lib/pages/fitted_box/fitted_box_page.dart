import 'package:flutter/material.dart';
import 'package:flutter_labs/utils/context.dart';
import 'package:url_launcher/url_launcher.dart';
import 'value_range_card.dart';

class FittedBoxExamplesPage extends StatelessWidget {
  const FittedBoxExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.fittedBoxExamplesTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              context.tr.fittedBoxExamplesDescription,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ValueRangeCard(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              context.tr.fittedBoxExamplesMoreInfo,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
