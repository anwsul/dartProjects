import 'dart:io';

const BOARD_SIZE = 3;
void main() {
  const PLAYER_ONE_PICK = 'X';
  const PLAYER_TWO_PICK = 'O';
  var currentPlayer = PLAYER_ONE_PICK;
  var board = List.generate(BOARD_SIZE, (_) => List.filled(BOARD_SIZE, ' '));

  while (true) {
    printBoard(board);
    play(board, currentPlayer);

    if (checkWin(board)) {
      print('Player ${currentPlayer} has won');
      return;
    }

    if (checkTie(board)) {
      print("It is a tie");
      return;
    }

    currentPlayer =
        currentPlayer == PLAYER_ONE_PICK ? PLAYER_TWO_PICK : PLAYER_ONE_PICK;
  }
}

void printBoard(List<List<String>> board) {
  print('    A   B   C');
  print('  -------------');

  for (int i = 0; i < BOARD_SIZE; i++) {
    stdout.write('$i |');
    for (int j = 0; j < BOARD_SIZE; j++) {
      stdout.write(' ${board[i][j]} |');
    }
    print('');
    print('  -------------');
  }
}

void printWinningBoard(List<List<String>> board, List<int> winningIndices) {
  const String reset = '\x1B[0m';
  const String highlightBackground = '\x1B[42m';

  print('    A   B   C');
  print('  -------------');

  for (int i = 0; i < BOARD_SIZE; i++) {
    stdout.write('$i |');
    for (int j = 0; j < BOARD_SIZE; j++) {
      if (winningIndices.contains(i * BOARD_SIZE + j)) {
        stdout.write('${highlightBackground} ${board[i][j]} ${reset}|');
      } else {
        stdout.write(' ${board[i][j]} |');
      }
    }
    print('');
    print('  -------------');
  }
}

void play(List<List<String>> board, String player) {
  int row = -1, col = -1;
  bool invalidMove = true;

  while (invalidMove) {
    invalidMove = false;
    print("Select a position (A0, A1, A2, B0, B1, B2, C0, C1, C2):");
    String position = stdin.readLineSync() ?? '';

    if (position.length != 2) {
      print("Invalid input. Please enter a valid position like A0.");
      invalidMove = true;
      continue;
    }

    row = int.tryParse(position[1]) ?? -1;
    col = position[0].toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);

    if (row < 0 || row >= BOARD_SIZE || col < 0 || col >= BOARD_SIZE) {
      print("Invalid input. Please enter a valid position.");
      invalidMove = true;
      continue;
    }

    if (board[row][col] != ' ') {
      print("Illegal move, this place has already been occupied");
      invalidMove = true;
    }
  }

  board[row][col] = player;
}

bool checkWin(List<List<String>> board) {
  // Row win
  for (int i = 0; i < BOARD_SIZE; i++) {
    if (board[i][0] == board[i][1] &&
        board[i][1] == board[i][2] &&
        board[i][0] != ' ') {
      printWinningBoard(
          board, [i * BOARD_SIZE, i * BOARD_SIZE + 1, i * BOARD_SIZE + 2]);
      return true;
    }
  }

  // Column win
  for (int i = 0; i < BOARD_SIZE; i++) {
    if (board[0][i] == board[1][i] &&
        board[1][i] == board[2][i] &&
        board[0][i] != ' ') {
      printWinningBoard(board, [i, i + BOARD_SIZE, i + 2 * BOARD_SIZE]);
      return true;
    }
  }

  // Diagonal win
  if ((board[0][0] == board[1][1] &&
      board[1][1] == board[2][2] &&
      board[0][0] != ' ')) {
    printWinningBoard(board, [0, 4, 8]);
    return true;
  }

  if (board[0][2] == board[1][1] &&
      board[1][1] == board[2][0] &&
      board[0][2] != ' ') {
    printWinningBoard(board, [2, 4, 6]);
    return true;
  }

  return false;
}

bool checkTie(List<List<String>> board) {
  for (int i = 0; i < BOARD_SIZE; i++) {
    for (int j = 0; j < BOARD_SIZE; j++) {
      if (board[i][j] == ' ') return false;
    }
  }

  return true;
}
