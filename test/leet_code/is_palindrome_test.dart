import 'package:flutter_labs/leet_code/is_palindrome.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final solution = Solution();
  group('isPalindromeWithoutStringMethod tests', () {
    test('Positive case: palindrome number', () {
      expect(solution.isPalindromeWithoutStringMethod(121), isTrue);
    });

    test('Negative case: non-palindrome number', () {
      expect(solution.isPalindromeWithoutStringMethod(123), isFalse);
    });

    test('Single-digit numbers are palindromes', () {
      expect(solution.isPalindromeWithoutStringMethod(7), isTrue);
      expect(solution.isPalindromeWithoutStringMethod(0), isTrue);
    });

    test('Palindromes with even digits', () {
      expect(solution.isPalindromeWithoutStringMethod(1221), isTrue);
    });

    test('Palindromes with odd digits', () {
      expect(solution.isPalindromeWithoutStringMethod(12321), isTrue);
    });

    test('Negative number is not a palindrome', () {
      expect(solution.isPalindromeWithoutStringMethod(-121), isFalse);
    });

    test('Edge case: 10 is not a palindrome', () {
      expect(solution.isPalindromeWithoutStringMethod(10), isFalse);
    });

    test('Edge case: 1001 is a palindrome', () {
      expect(solution.isPalindromeWithoutStringMethod(1001), isTrue);
    });

    test('Large palindrome number (even digits)', () {
      expect(
          solution.isPalindromeWithoutStringMethod(98765432123456789), isTrue);
    });

    test('Large palindrome number (odd digits)', () {
      expect(
          solution.isPalindromeWithoutStringMethod(12345678987654321), isTrue);
    });

    test('Non-palindrome large number', () {
      expect(
          solution.isPalindromeWithoutStringMethod(12345678998765432), isFalse);
    });

    test('Largest 32-bit palindrome', () {
      expect(solution.isPalindromeWithoutStringMethod(2147447412), isTrue);
    });
  });
}
