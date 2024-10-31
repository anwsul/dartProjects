import 'calc.dart';

void main() {
  promptUserForInputs();
  List<double> numList = readNumbers();
  validateNumbers(numList);
  promptUserForOperation();
  String? operand = readOperand();
  validateOperation(operand);
  displayResult(numList, operand!);
}
