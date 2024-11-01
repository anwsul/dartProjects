import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  final answer = random.nextInt(100) + 1;

  print(
      "I'm thinking of a number between 1 and 100. Can you guess what it is?");
  int guess;
  int numGuesses = 0;

  do {
    stdout.write("Enter your guess: ");
    guess = int.parse(stdin.readLineSync()!);
    numGuesses++;

    if (guess < answer) {
      print("Too low. Guess higher.");
    } else if (guess > answer) {
      print("Too high. Guess lower.");
    } else {
      print("Congratulations, you guessed the number in $numGuesses guesses!");
    }
  } while (guess != answer);
}
