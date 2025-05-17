import 'package:project/tic_tac_toe.dart';
import 'dart:io';
import 'dart:async';

void main() async {
  print(TicTacToe.instructions);
  // Stream to manage game sessions
  final gameSessionController = StreamController<bool>();
  final gameSessionSubscription = gameSessionController.stream.listen((
    playAgain,
  ) async {
    if (playAgain) {
      final game = TicTacToe();
      await game.play();

      String? input;
      while (input == null) {
        print('\nDo you want to play again? (y/n)');
        final rawInput = stdin.readLineSync()?.toLowerCase();

        if (rawInput == 'y' || rawInput == 'n') {
          input = rawInput;
        } else {
          print('Invalid input. Please enter only "y" or "n".');
        }
      }

      gameSessionController.add(input == 'y');
    } else {
      print('Thanks for playing! Goodbye.');
      await gameSessionController.close();
    }
  });

  // Start the first session
  gameSessionController.add(true);

  // Wait until the stream ends
  await gameSessionSubscription.asFuture();
}
