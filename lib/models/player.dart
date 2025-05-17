import '../enums/marker.dart';

// Base class for a player (human or computer)
abstract class Player {
  // Player's marker (X or O)
  final Marker marker;
  Player(this.marker);
  // Get the player's move (to be implemented in subclasses)
  Future<int> getMove(List<Marker> board);
}
