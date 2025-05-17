import '../enums/marker.dart';

// Mixin to print the game board
mixin BoardPrinter {
  // Print the current game board
  void printBoard(List<Marker> board) {
    print('\nCurrent Board:');
    for (int i = 0; i < 9; i += 3) {
      print(
        ' ${_markerToString(board[i], i)} | ${_markerToString(board[i + 1], i + 1)} | ${_markerToString(board[i + 2], i + 2)} ',
      );
      if (i < 6) print('-----------');
    }
  }

  // Convert marker to text (X, O) or cell number if it's empty
  String _markerToString(Marker marker, int position) {
    return marker == Marker.X
        ? 'X'
        : marker == Marker.O
        ? 'O'
        : (position + 1).toString();
  }
}
