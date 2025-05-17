import 'mixins/board_printer.dart';
import 'models/player.dart';
import 'models/human_player.dart';
import 'models/ai_player.dart';
import 'enums/marker.dart';
import 'enums/game_state.dart';
import 'dart:io';

// Main game class
class TicTacToe with BoardPrinter {
  // 3x3 game board
  late List<Marker> board;
  late Player currentPlayer;
  late Player playerX;
  late Player playerO;
  // Is the game against AI?
  bool isAgainstAI = false;

  // Game instructions
  static const String instructions = '''
Welcome to Tic-Tac-Toe!
The board positions are numbered as follows:
 1 | 2 | 3 
-----------
 4 | 5 | 6 
-----------
 7 | 8 | 9 
''';

  TicTacToe() {
    _initializeGame();
  }

  // Set up the game
  void _initializeGame() {
    // Empty board
    board = List.filled(9, Marker.none);

    print(instructions);

    bool? againstAI;
    while (againstAI == null) {
      print('\nDo you want to play against the computer? (y/n)');
      final input = stdin.readLineSync()?.toLowerCase();

      if (input == 'y') {
        againstAI = true;
      } else if (input == 'n') {
        againstAI = false;
      } else {
        print('Invalid input. Please enter only "y" or "n".');
      }
    }
    isAgainstAI = againstAI;

    if (isAgainstAI) {
      Marker? humanMarker;
      while (humanMarker == null) {
        print('\nChoose your marker (X or O):');
        final input = stdin.readLineSync()?.toUpperCase();

        if (input == 'X') {
          humanMarker = Marker.X;
        } else if (input == 'O') {
          humanMarker = Marker.O;
        } else {
          print('Invalid choice. Please choose only "X" or "O".');
        }
      }
      playerX =
          humanMarker == Marker.X ? HumanPlayer(Marker.X) : AIPlayer(Marker.X);
      playerO =
          humanMarker == Marker.O ? HumanPlayer(Marker.O) : AIPlayer(Marker.O);
    } else {
      playerX = HumanPlayer(Marker.X);
      playerO = HumanPlayer(Marker.O);
    }
    // X always starts first
    currentPlayer = playerX;
  }

  // Start the game
  // Using polymorphism through Player interface
  Future<void> play() async {
    print('\nGame started!');
    printBoard(board);

    GameState gameState = GameState.playing;

    while (gameState == GameState.playing) {
      try {
        final move = await currentPlayer.getMove(board);
        // Apply the move
        board[move] = currentPlayer.marker;
        printBoard(board);

        if (_checkWinner(currentPlayer.marker)) {
          gameState = GameState.win;
          print(
            currentPlayer is AIPlayer
                ? 'AI wins!'
                : 'Player ${currentPlayer.marker == Marker.X ? 'X' : 'O'} wins!',
          );
        } else if (_checkDraw()) {
          gameState = GameState.draw;
          print('It\'s a draw!');
        } else {
          // Switch players
          currentPlayer = currentPlayer == playerX ? playerO : playerX;
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  // Check for a winner
  bool _checkWinner(Marker marker) {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == marker &&
          board[i + 1] == marker &&
          board[i + 2] == marker) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] == marker &&
          board[i + 3] == marker &&
          board[i + 6] == marker) {
        return true;
      }
    }

    // Check diagonals
    if (board[0] == marker && board[4] == marker && board[8] == marker) {
      return true;
    }
    if (board[2] == marker && board[4] == marker && board[6] == marker) {
      return true;
    }

    return false;
  }

  // Check for a draw
  bool _checkDraw() {
    // All cells are filled
    return board.every((cell) => cell != Marker.none);
  }
}
