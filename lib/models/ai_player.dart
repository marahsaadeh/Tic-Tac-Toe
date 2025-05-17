import 'player.dart';
import '../enums/marker.dart';
import 'dart:async';

// Computer player (AI)
class AIPlayer extends Player {
  AIPlayer(super.marker);

  @override
  Future<int> getMove(List<Marker> board) async {
    // Simulate thinking time
    await Future.delayed(Duration(seconds: 1));

    // Using a Map for move priorities
    final Map<int, int> moveScores = {};

    //1 Check for winning move
    for (int i = 0; i < 9; i++) {
      if (board[i] == Marker.none) {
        moveScores[i] = _evaluateMove(board, i, marker) ? 100 : 0;
      }
    }

    //2 Block opponent's winning move
    final opponentMarker = marker == Marker.X ? Marker.O : Marker.X;
    for (int i = 0; i < 9; i++) {
      if (board[i] == Marker.none && _evaluateMove(board, i, opponentMarker)) {
        moveScores[i] = (moveScores[i] ?? 0) + 50;
      }
    }

    //3 Prefer the center if it's empty
    if (board[4] == Marker.none) {
      moveScores[4] = (moveScores[4] ?? 0) + 10;
    }

    //4 Prefer corners if they're empty
    const corners = [0, 2, 6, 8];
    for (final corner in corners) {
      if (board[corner] == Marker.none) {
        moveScores[corner] = (moveScores[corner] ?? 0) + 5;
      }
    }

    // Choose best move
    if (moveScores.isEmpty) return 0;
    final bestMove =
        moveScores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    return bestMove;
  }

  // Check if this move leads to a win
  bool _evaluateMove(List<Marker> board, int position, Marker testMarker) {
    // Make a test move
    board[position] = testMarker;
    final isWinning = _checkWinner(board, testMarker);
    // Undo the test move
    board[position] = Marker.none;
    return isWinning;
  }

  // Check for a winner
  bool _checkWinner(List<Marker> board, Marker playerMarker) {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == playerMarker &&
          board[i + 1] == playerMarker &&
          board[i + 2] == playerMarker) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] == playerMarker &&
          board[i + 3] == playerMarker &&
          board[i + 6] == playerMarker) {
        return true;
      }
    }

    // Check diagonals
    if (board[0] == playerMarker &&
        board[4] == playerMarker &&
        board[8] == playerMarker) {
      return true;
    }
    if (board[2] == playerMarker &&
        board[4] == playerMarker &&
        board[6] == playerMarker) {
      return true;
    }

    return false;
  }
}
