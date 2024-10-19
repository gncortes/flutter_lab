import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const loopLenght = 100000;

void logPerformanceResult(String testName, int elapsedTime) {
  final String separator = '-' * 40;
  debugPrint(
      '$separator\nTest Name: $testName\nTempo total: $elapsedTime microssegundos\n$separator');
}

class ColorfulBox extends StatelessWidget {
  final bool isRed;
  final Color color;

  const ColorfulBox({super.key, required this.isRed})
      : color = isRed ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

class ColorfulBoxWithBuildColor extends StatelessWidget {
  final bool isRed;

  const ColorfulBoxWithBuildColor({super.key, required this.isRed});

  @override
  Widget build(BuildContext context) {
    final color = isRed ? Colors.red : Colors.blue;
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

class ColorfulBoxWithMethod {
  Widget buildColorfulBox(bool isRed) {
    final color = isRed ? Colors.red : Colors.blue;
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

void main() {
  testWidgets('Performance test: Color via constructor',
      (WidgetTester tester) async {
    bool isRed = true;

    // Ignore the time of the first build
    await tester.pumpWidget(MaterialApp(
      home: StatefulBuilder(
        builder: (context, setState) {
          return ColorfulBox(isRed: isRed);
        },
      ),
    ));

    // Now, measure the time for multiple reconstructions
    final stopwatch = Stopwatch()..start();
    for (int i = 0; i < loopLenght; i++) {
      await tester.pumpWidget(MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) {
            return ColorfulBox(isRed: isRed);
          },
        ),
      ));
    }
    stopwatch.stop();

    // Usando a função para logar o resultado
    logPerformanceResult(
        'Color via constructor', stopwatch.elapsedMicroseconds);
  });

  testWidgets('Performance test: Color inside build',
      (WidgetTester tester) async {
    bool isRed = true;

    // Ignore the time of the first build
    await tester.pumpWidget(MaterialApp(
      home: StatefulBuilder(
        builder: (context, setState) {
          return ColorfulBoxWithBuildColor(isRed: isRed);
        },
      ),
    ));

    // Now, measure the time for multiple reconstructions
    final stopwatch = Stopwatch()..start();
    for (int i = 0; i < loopLenght; i++) {
      await tester.pumpWidget(MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) {
            return ColorfulBoxWithBuildColor(isRed: isRed);
          },
        ),
      ));
    }
    stopwatch.stop();

    // Usando a função para logar o resultado
    logPerformanceResult('Color inside build', stopwatch.elapsedMicroseconds);
  });

  testWidgets('Performance test: Color built via method',
      (WidgetTester tester) async {
    bool isRed = true;
    final instance = ColorfulBoxWithMethod();

    // Ignore the time of the first build
    await tester.pumpWidget(MaterialApp(
      home: StatefulBuilder(
        builder: (context, setState) {
          return instance.buildColorfulBox(isRed);
        },
      ),
    ));

    // Now, measure the time for multiple reconstructions
    final stopwatch = Stopwatch()..start();
    for (int i = 0; i < loopLenght; i++) {
      await tester.pumpWidget(MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) {
            return instance.buildColorfulBox(isRed);
          },
        ),
      ));
    }
    stopwatch.stop();

    // Usando a função para logar o resultado
    logPerformanceResult(
        'Color built via method', stopwatch.elapsedMicroseconds);
  });
}
