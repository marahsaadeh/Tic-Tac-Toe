import 'player.dart';
import '../enums/marker.dart';
import 'dart:io';

// Human player class
class HumanPlayer extends Player {
  HumanPlayer(super.marker);

  @override
  Future<int> getMove(List<Marker> board) async {
    while (true) {
      print(
        '\nPlayer ${marker == Marker.X ? 'X' : 'O'}, enter your move (1-9):',
      );
      final input = stdin.readLineSync();
      final move = int.tryParse(input ?? '');

      // Check if input is valid
      if (move == null || move < 1 || move > 9) {
        print('Invalid input. Please enter a number between 1 and 9.');
        continue;
      }
      // Check if the cell is empty
      if (board[move - 1] != Marker.none) {
        print('That position is already taken. Please choose another.');
        continue;
      }

      return move - 1;
    }
  }
}
