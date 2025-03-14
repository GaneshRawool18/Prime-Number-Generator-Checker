bool isPrime(int number) {
  if (number <= 1) return false;
  for (int i = 2; i * i <= number; i++) {
    if (number % i == 0) return false;
  }
  return true;
}

List<int> generatePrimes(int start, int end) {
  List<int> primes = [];
  for (int i = start; i <= end; i++) {
    if (isPrime(i)) primes.add(i);
  }
  return primes;
}
