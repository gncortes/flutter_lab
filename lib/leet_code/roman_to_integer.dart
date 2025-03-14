class RomanToInteger {
  int romanToInt(String s) {
    Map<String, int> values = {
      "I": 1,
      "IV": 4,
      "V": 5,
      "IX": 9,
      "X": 10,
      "XL": 40,
      "L": 50,
      "XC": 90,
      "C": 100,
      "CD": 400,
      "D": 500,
      "CM": 900,
      "M": 1000
    };

    int value = 0;

    for (int index = 0; index < s.length; index++) {
      if (index < s.length - 1 && values.containsKey(s[index] + s[index + 1])) {
        value += values[s[index] + s[index + 1]]!;
        index++;
      } else {
        value += values[s[index]]!;
      }
    }

    return value;
  }
}
