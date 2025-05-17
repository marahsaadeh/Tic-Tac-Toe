# 🎯 Tic-Tac-Toe Game in Dart

A console-based implementation of the classic Tic-Tac-Toe game written in Dart, featuring both human vs human and human vs AI gameplay modes.

## 🚀 Features

| Feature | Description |
|---------|-------------|
| 🎮 **Game Modes** | Human vs Human or Human vs AI |
| 🤖 **AI Opponent** | Smart computer player with basic strategy |
| ✅ **Input Validation** | Ensures all moves are valid |
| 🏆 **Win Detection** | Automatically detects winning conditions |
| 🤝 **Draw Detection** | Identifies when the game ends in a tie |
| 🔄 **Replay Option** | Play again after game ends |
| 📊 **Clear Display** | Easy-to-read numbered board |

## 🛠️ How to Run the Game

1. **Clone the repository**:
   ```bash
   git clone https://github.com/marahsaadeh/Tic-Tac-Toe.git
   ```

2. **Run the game**:
   - Click `Run` in your IDE
   - Open terminal and execute:
     ```bash
     dart run project.dart
     ```

## 📖 Game Instructions

### 🏁 Starting the Game
1. Choose to play against computer (AI) or human
2. Select your marker (X or O) when playing against AI
   - X always goes first

### 🎲 Making Moves
- Board positions are numbered 1-9:
  ```
   1 | 2 | 3 
  -----------
   4 | 5 | 6 
  -----------
   7 | 8 | 9 
  ```
- Enter the number (1-9) of your desired position

### 🏆 Winning the Game
- First to get 3 markers in a row (any direction) wins
- Game ends in draw if board fills with no winner

## ⚙️ Technical Implementation

### 🛠️ Dart Features Used
| Feature | Purpose |
|---------|---------|
| 🧩 **Enums** | Game state and player markers |
| � **Mixin** | Board printing functionality |
| 🏗️ **Classes** | Player implementations (Human/AI) |
| ⏳ **Async Programming** | Handle player input |
| 🌊 **Streams** | Manage game sessions |

### 🤖 AI Strategy
1. 🔍 First checks for winning moves
2. 🛡️ Blocks opponent's winning moves
3. ⭐ Prefers center and corner positions
4. 🎲 Random move if no strategy applies


Enjoy the game! �✨


