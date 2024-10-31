import 'temperature.dart';

void main() {
  promptUserForTemperature();
  double? temperature = readTemperature();
  validateTemperature(temperature);
  promptUserForConversionChoice();
  String? conversionChoice = readConversionChoice();
  displayConversionResult(temperature!, conversionChoice);
}
