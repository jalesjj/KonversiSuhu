import 'package:flutter/material.dart';

class TemperatureProvider with ChangeNotifier {
  final TextEditingController suhuController = TextEditingController();
  double hasil = 0;
  String selectedFrom = 'Celsius';
  String selectedTo = 'Fahrenheit';

  final Map<String, String> suhuMap = {
    'Celsius': 'C',
    'Fahrenheit': 'F',
    'Reamur': 'R',
    'Kelvin': 'K',
  };

  void convertTemperature() {
    double suhu = double.tryParse(suhuController.text) ?? 0;
    String from = suhuMap[selectedFrom]!;
    String to = suhuMap[selectedTo]!;

    if (from == 'C') {
      if (to == 'F') hasil = (suhu * 9 / 5) + 32;
      else if (to == 'R') hasil = suhu * 4 / 5;
      else if (to == 'K') hasil = suhu + 273.15;
      else hasil = suhu;
    } else if (from == 'F') {
      if (to == 'C') hasil = (suhu - 32) * 5 / 9;
      else if (to == 'R') hasil = (suhu - 32) * 4 / 9;
      else if (to == 'K') hasil = (suhu - 32) * 5 / 9 + 273.15;
      else hasil = suhu;
    } else if (from == 'R') {
      if (to == 'C') hasil = suhu * 5 / 4;
      else if (to == 'F') hasil = (suhu * 9 / 4) + 32;
      else if (to == 'K') hasil = (suhu * 5 / 4) + 273.15;
      else hasil = suhu;
    } else if (from == 'K') {
      if (to == 'C') hasil = suhu - 273.15;
      else if (to == 'F') hasil = (suhu - 273.15) * 9 / 5 + 32;
      else if (to == 'R') hasil = (suhu - 273.15) * 4 / 5;
      else hasil = suhu;
    }

    notifyListeners();
  }
}
