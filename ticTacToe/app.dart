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
      print('player ${currentPlayer} has won');
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
  print('  0 1 2');
  for (int i = 0; i < BOARD_SIZE; i++) {
    stdout.write('$i ');
    for (int j = 0; j < BOARD_SIZE; j++) {
      stdout.write('${board[i][j]} ');
    }
    print('');
  }
}

void play(List<List<String>> board, String player) {
  int row, col;

  do {
    print("Select the row to move(0-2)");
    row = int.tryParse(stdin.readLineSync() ?? '') ?? 2;
    print("Select the column to move(0-2)");
    col = int.tryParse(stdin.readLineSync() ?? '') ?? 2;

    if (board[row][col] != ' ') {
      print("Illegal move, this place has already been occupied");
    }
  } while (board[row][col] != ' ');

  board[row][col] = player;
}

bool checkWin(List<List<String>> board) {
  // row win
  for (int i = 0; i < BOARD_SIZE; i++) {
    if (board[i][0] == board[i][1] &&
        board[i][1] == board[i][2] &&
        board[i][0] != ' ') {
      return true;
    }
  }

  // column win
  for (int i = 0; i < BOARD_SIZE; i++) {
    if (board[0][i] == board[1][i] &&
        board[1][i] == board[2][i] &&
        board[0][i] != ' ') {
      return true;
    }
  }

  //diagonal win
  if ((board[0][0] == board[1][1] &&
          board[1][1] == board[2][2] &&
          board[0][0] != ' ') ||
      (board[0][2] == board[1][1] &&
          board[1][1] == board[2][0] &&
          board[0][2] != ' ')) {
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
