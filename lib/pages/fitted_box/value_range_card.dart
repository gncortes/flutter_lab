import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const double _minValue = 1;
const double _maxValue = 1000000000000000000;

class ValueRangeCard extends StatefulWidget {
  const ValueRangeCard({super.key});

  @override
  State<ValueRangeCard> createState() => _ValueRangeCardState();
}

class _ValueRangeCardState extends State<ValueRangeCard> {
  double _currentValue = 1;
  double _displayValue = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Valor Atual',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Quantidade de dígitos: ${_currentValue.digitCount}',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: 16),
            FittedBox(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Text(
                  _displayValue.toCurrency(),
                  key: ValueKey<double>(_displayValue),
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            RangeSlider(
              values: RangeValues(_minValue, _currentValue),
              min: _minValue,
              max: _maxValue,
              divisions: 10000,
              onChanged: (values) {
                setState(() {
                  _currentValue = values.end;
                });
              },
              onChangeEnd: (value) {
                setState(() {
                  _displayValue = value.end;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

extension UtilsDoubleExtension on double {
  String toCurrency() {
    final NumberFormat formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );
    return formatter.format(this);
  }

  int get digitCount {
    String valueStr = toStringAsFixed(0).replaceAll(RegExp(r'[^0-9]'), '');
    return valueStr.length;
  }
}
