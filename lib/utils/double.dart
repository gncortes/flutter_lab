import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

extension CurrencyExtension on double {
  String toCurrency(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: NumberFormat.simpleCurrency(locale: locale).currencySymbol,
      decimalDigits: 2,
    );
    return formatter.format(this);
  }
}

extension DigitCountExtension on double {
  int get digitCount {
    String valueStr = toStringAsFixed(0).replaceAll(RegExp(r'[^0-9]'), '');
    return valueStr.length;
  }
}

double pow(double base, int exponent) {
  return base * List.generate(exponent, (_) => 10.0).reduce((a, b) => a * b);
}
