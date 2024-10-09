import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const double _minValue = 1;
const double _maxValue = 1000000000000;

class ValueRangeCard extends StatefulWidget {
  const ValueRangeCard({super.key});

  @override
  State<ValueRangeCard> createState() => _ValueRangeCardState();
}

class _ValueRangeCardState extends State<ValueRangeCard> {
  double _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Valor Ajustável',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            FittedBox(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Text(
                  _currentValue.toCurrency(),
                  key: ValueKey<double>(_currentValue),
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
            ),
          ],
        ),
      ),
    );
  }
}

extension CurrencyExtension on double {
  String toCurrency() {
    final NumberFormat formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );
    return formatter.format(this);
  }
}
