import 'dart:math';

class Solution {
  bool isPalindromeWithStringMethod(int x) {
    final value = x.toString();

    if (value.length == 1) {
      return true;
    }

    if (value[0] == '-') {
      return false;
    }

    String newValue = '';
    for (int index = value.length - 1; index >= 0; index--) {
      newValue += value[index];
    }

    return x == int.parse(newValue);
  }

  bool isPalindromeWithoutStringMethod(int x) {
    if (x.isNegative) return false;
    if (x < 10) return true;

    int length = (log(x) / log(10)).floor() + 1;

    for (int i = 0; i < length ~/ 2; i++) {
      int firstDigit = (x ~/ pow(10, length - i - 1).toInt()) % 10;
      int lastDigit = (x ~/ pow(10, i).toInt()) % 10;

      if (firstDigit != lastDigit) return false;
    }

    return true;
  }
}
