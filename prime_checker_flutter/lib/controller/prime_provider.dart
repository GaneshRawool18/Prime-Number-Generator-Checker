import 'package:flutter/material.dart';
import '../utils/prime_utils.dart';

class PrimeProvider extends ChangeNotifier {
  String resultText = "";
  List<int> primes = [];

  void resetMessage() {
    resultText = "";
    primes.clear();
    notifyListeners();
  }

  void checkPrime(String input) {
    resetMessage(); // Clear previous messages

    if (input.isEmpty) {
      resultText = "❌ Please enter a number!";
    } else {
      int? number = int.tryParse(input);
      if (number == null) {
        resultText = "❌ Invalid input! Please enter a number.";
      } else if (number < 0) {
        resultText = "❌ Negative numbers cannot be prime.";
      } else if (number <= 1) {
        resultText = "❌ $number is NOT a Prime Number.";
      } else {
        resultText = isPrime(number) ? "✅ $number is a Prime Number." : "❌ $number is NOT a Prime Number.";
      }
    }
    notifyListeners();
  }

  void generatePrimeNumbers(String startInput, String endInput) {
    resetMessage(); // Clear previous messages

    if (startInput.isEmpty || endInput.isEmpty) {
      resultText = "❌ Please enter both start and end values!";
    } else {
      int? start = int.tryParse(startInput);
      int? end = int.tryParse(endInput);

      if (start == null || end == null) {
        resultText = "❌ Invalid input! Please enter numbers.";
      } else if (start < 0 || end < 0) {
        resultText = "❌ Negative numbers are not allowed!";
      } else if (start >= end) {
        resultText = "❌ Invalid range: Start should be less than End!";
      } else if (end - start > 10000) {
        resultText = "⚠️ The range is too large! Enter a smaller range.";
      } else {
        primes = generatePrimes(start, end);
        resultText = primes.isNotEmpty ? "✅ Prime numbers from $start to $end:" : "❌ No prime numbers found in this range!";
      }
    }
    notifyListeners();
  }
}
