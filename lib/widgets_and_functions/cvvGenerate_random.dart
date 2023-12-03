import 'dart:math';

class RandomCVV {
  String generateCVV() {
    String number = '';
    var randomnumber = Random();
    for (var i = 0; i < 3; i++) {
      number = number + randomnumber.nextInt(9).toString();
    }
    return number;
  }
}
