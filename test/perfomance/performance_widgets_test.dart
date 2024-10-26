import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const loopLength = 60 * 60;

void logPerformanceResult(String testName, int elapsedTime) {
  final String separator = '-' * 40;
  debugPrint(
      '$separator\nTest Name: $testName\nDuration: $elapsedTime elapsedMilliseconds\n$separator');
}

class ColorfulBox extends StatelessWidget {
  final int colorCode;
  final Color color;

  ColorfulBox({super.key, required this.colorCode})
      : color = (() {
          switch (colorCode) {
            case 1:
              return Colors.red;
            case 2:
              return Colors.green;
            case 3:
              return Colors.blue;
            case 4:
              return Colors.yellow;
            case 5:
              return Colors.purple;
            default:
              return Colors.grey;
          }
        })();

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
  final int colorCode;

  const ColorfulBoxWithBuildColor({super.key, required this.colorCode});

  @override
  Widget build(BuildContext context) {
    final Color color;

    switch (colorCode) {
      case 1:
        color = Colors.red;
        break;
      case 2:
        color = Colors.green;
        break;
      case 3:
        color = Colors.blue;
        break;
      case 4:
        color = Colors.yellow;
        break;
      case 5:
        color = Colors.purple;
        break;
      default:
        color = Colors.grey;
        break;
    }

    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

class ColorfulBoxWithMethod {
  Widget buildColorfulBox(int colorCode) {
    final Color color;

    switch (colorCode) {
      case 1:
        color = Colors.red;
        break;
      case 2:
        color = Colors.green;
        break;
      case 3:
        color = Colors.blue;
        break;
      case 4:
        color = Colors.yellow;
        break;
      case 5:
        color = Colors.purple;
        break;
      default:
        color = Colors.grey;
        break;
    }
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
    int colorCode = 1;

    // Ignore the time of the first build
    await tester.pumpWidget(MaterialApp(
      home: StatefulBuilder(
        builder: (context, setState) {
          return ColorfulBox(colorCode: colorCode);
        },
      ),
    ));

    // Now, measure the time for multiple reconstructions
    final stopwatch = Stopwatch()..start();
    for (int i = 0; i < loopLength; i++) {
      // colorCode = (i % 5) + 1; // Alterna entre as cores de 1 a 5
      await tester.pumpWidget(MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) {
            return ColorfulBox(
              colorCode: colorCode,
              key: const Key('comkey'),
            );
          },
        ),
      ));
    }
    stopwatch.stop();

    // Usando a função para logar o resultado
    logPerformanceResult(
        'Color via constructor', stopwatch.elapsedMilliseconds);
  });

  testWidgets('Performance test: Color inside build',
      (WidgetTester tester) async {
    int colorCode = 1;

    // Ignore the time of the first build
    await tester.pumpWidget(MaterialApp(
      home: StatefulBuilder(
        builder: (context, setState) {
          return ColorfulBoxWithBuildColor(colorCode: colorCode);
        },
      ),
    ));

    // Now, measure the time for multiple reconstructions
    final stopwatch = Stopwatch()..start();
    for (int i = 0; i < loopLength; i++) {
      // colorCode = (i % 5) + 1; // Alterna entre as cores de 1 a 5
      await tester.pumpWidget(MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) {
            return ColorfulBoxWithBuildColor(colorCode: colorCode);
          },
        ),
      ));
    }
    stopwatch.stop();

    // Usando a função para logar o resultado
    logPerformanceResult('Color inside build', stopwatch.elapsedMilliseconds);
  });

  testWidgets('Performance test: Color built via method',
      (WidgetTester tester) async {
    int colorCode = 1;
    final instance = ColorfulBoxWithMethod();

    // Ignore the time of the first build
    await tester.pumpWidget(MaterialApp(
      home: StatefulBuilder(
        builder: (context, setState) {
          return instance.buildColorfulBox(colorCode);
        },
      ),
    ));

    // Now, measure the time for multiple reconstructions
    final stopwatch = Stopwatch()..start();
    for (int i = 0; i < loopLength; i++) {
      // colorCode = (i % 5) + 1; // Alterna entre as cores de 1 a 5
      await tester.pumpWidget(MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) {
            return instance.buildColorfulBox(colorCode);
          },
        ),
      ));
    }
    stopwatch.stop();

    // Usando a função para logar o resultado
    logPerformanceResult(
        'Color built via method', stopwatch.elapsedMilliseconds);
  });

  testWidgets('Performance test: Color via constructor',
      (WidgetTester tester) async {
    int colorCode = 1;
    int totalDuration = 0;
    const repetitions = 10;

    for (int r = 0; r < repetitions; r++) {
      await tester.pumpWidget(MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) {
            return ColorfulBox(colorCode: colorCode);
          },
        ),
      ));

      final stopwatch = Stopwatch()..start();
      for (int i = 0; i < loopLength; i++) {
        colorCode = (i % 5) + 1;
        await tester.pumpWidget(MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return ColorfulBox(colorCode: colorCode);
            },
          ),
        ));
      }
      stopwatch.stop();
      totalDuration += stopwatch.elapsedMilliseconds;
    }

    logPerformanceResult(
        'Color via constructor in loop', totalDuration ~/ repetitions);
  });
}
