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
    final logBase10 = log(10) / log(x);
    int length = logBase10.floor() + 1;

    String newValue = '';

    for (int index = length; index >= 0; index--) {
      double power = pow(10, length - index).toDouble();
      newValue += ((x / power) % 10).toString();
    }

    return x == int.parse(newValue);
  }
}
