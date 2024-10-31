import 'dart:io';

void promptUserForInputs() {
  print("Enter the numbers to be operated on");
  print("To stop entering, put any non-numeric value");
}

List<double> readNumbers() {
  List<double> numList = [];
  double? number;

  do {
    String? input = stdin.readLineSync();
    number = double.tryParse(input ?? '');
    if (number != null) numList.add(number);
  } while (number != null);

  return numList;
}

void validateNumbers(List<double> numList) {
  if (numList.length == 0) {
    print("No input provided exiting...");
    exit(-1);
  }
}

void promptUserForOperation() {
  print('Choose an operation (+, -, *, /):');
}

String? readOperand() {
  return stdin.readLineSync();
}

void validateOperation(String? operand) {
  List<String> validOperations = ['+', '-', '*', '/'];

  if (!validOperations.contains(operand)) {
    print('Operand not valid, exiting...');
    exit(-1);
  }
}

displayResult(List<double> numList, String operand) {
  double result = 0;

  switch (operand) {
    case '+':
      for (double num in numList) result += num;
    case '-':
      result = numList[0];
      for (double num in numList.sublist(1)) result -= num;
    case '*':
      result = 1;
      for (double num in numList) result *= num;
    case '/':
      result = numList[0];
      for (double num in numList.sublist(1)) result /= num;
  }

  print('The result is ${result}');
}
