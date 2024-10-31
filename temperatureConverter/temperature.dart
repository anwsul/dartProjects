import 'dart:io';

void promptUserForTemperature() =>
    stdout.write("Enter the temperature to be converted: ");

double? readTemperature() {
  String? input = stdin.readLineSync();
  return double.tryParse(input ?? '');
}

String? readConversionChoice() => stdin.readLineSync()?.toLowerCase();

void promptUserForConversionChoice() =>
    stdout.write('Convert to (F)ahrenheit or (C)elsius? ');

void validateTemperature(double? temperature) {
  if (temperature == null) {
    print('Invalid temperature input. Please enter a valid number.');
    exit(-1);
  }
}

void displayConversionResult(double temperature, String? choice) {
  double result;
  String unit;

  if (choice == 'f') {
    result = temperature * 9 / 5 + 32;
    unit = 'F';
  } else if (choice == 'c') {
    result = (temperature - 32) * 5 / 9;
    unit = 'C';
  } else {
    print('Invalid choice. Please enter "F" or "C".');
    exit(-1);
  }

  print('$temperature° ${unit == 'F' ? 'C' : 'F'} is $result° $unit');
}
