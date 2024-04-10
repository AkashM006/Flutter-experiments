import 'dart:math';

int getRandomInteger() {
  Random random = Random();

  int uniqueInteger = random.nextInt(10);

  return uniqueInteger;
}
