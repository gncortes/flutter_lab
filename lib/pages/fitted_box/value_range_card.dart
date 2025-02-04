import 'package:flutter/material.dart';
import 'package:flutter_labs/utils/context.dart';
import 'package:flutter_labs/utils/double.dart';

const double _minExponent = 0;
const double _maxExponent = 17;

class ValueRangeCard extends StatefulWidget {
  const ValueRangeCard({super.key});

  @override
  State<ValueRangeCard> createState() => _ValueRangeCardState();
}

class _ValueRangeCardState extends State<ValueRangeCard> {
  double _currentExponent = 0;
  final double _baseValue = 1;
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
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Text(
                    context.tr.fittedBoxValueLabel,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: FittedBox(
                    child: Text.rich(
                      TextSpan(
                        text: context.tr.fittedBoxDigitCountLabel,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: '${_displayValue.digitCount}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                  _displayValue.toCurrency(context),
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
              values: RangeValues(_minExponent, _currentExponent),
              min: _minExponent,
              max: _maxExponent,
              divisions: _maxExponent.toInt(),
              labels: RangeLabels(
                '10^${_minExponent.toInt()}',
                '10^${_currentExponent.toInt()}',
              ),
              onChanged: (values) {
                setState(() {
                  _currentExponent = values.end;
                  _displayValue =
                      _baseValue * pow(10, _currentExponent.toInt());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
