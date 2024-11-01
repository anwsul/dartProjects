import "dart:async";
import "dart:io";

void main() {
  print("Enter the countdown time in seconds:");
  final countdown = int.tryParse(stdin.readLineSync() ?? '') ?? 1;

  print("Starting countdown...");

  Timer.periodic(Duration(seconds: 1), (timer) {
    if (countdown == timer.tick) {
      print("Time is up!");
      timer.cancel();
    } else {
      print(countdown - timer.tick);
    }
  });
}
