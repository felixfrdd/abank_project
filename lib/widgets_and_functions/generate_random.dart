import 'dart:math';

class RandomTenDigitAccount {
  String generateRandomNumber() {
    String number = '';
    var randomnumber = Random();
    for (var i = 0; i < 10; i++) {
      number = number + randomnumber.nextInt(9).toString();
    }
    return number;
  }
}
