import 'package:flutter/material.dart';

class ConnectFourGame extends StatefulWidget {
  const ConnectFourGame({super.key});

  @override
  _ConnectFourGameState createState() => _ConnectFourGameState();
}

class _ConnectFourGameState extends State<ConnectFourGame> {
  static const int numRows = 6;
  static const int numCols = 7;
  static const int numToWin = 4;

  List<List<int>> board =
      List.generate(numRows, (_) => List.filled(numCols, 0));
  bool isRedTurn = true; // Red starts the game

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Four'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: numCols * 40.0,
              height: numRows * 40.0,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: numCols,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: numRows * numCols,
                itemBuilder: (BuildContext context, int index) {
                  int row = index ~/ numCols;
                  int col = index % numCols;
                  return GestureDetector(
                    onTap: () => dropDisc(col),
                    child: Container(
                      decoration: BoxDecoration(
                        color: board[row][col] == 0
                            ? Colors.white
                            : board[row][col] == 1
                                ? Colors.red
                                : Colors.yellow,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          board[row][col] == 0
                              ? ''
                              : board[row][col] == 1
                                  ? 'R'
                                  : 'Y',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: resetGame,
              child: const Text('Reset Game'),
            ),
          ],
        ),
      ),
    );
  }

  void dropDisc(int col) {
    for (int row = numRows - 1; row >= 0; row--) {
      if (board[row][col] == 0) {
        setState(() {
          board[row][col] = isRedTurn ? 1 : 2;
          if (checkForWin(row, col)) {
            Future.delayed(const Duration(milliseconds: 300), () {
              showWinDialog(isRedTurn ? 'Red' : 'Yellow');
            });
          } else {
            isRedTurn = !isRedTurn;
          }
        });
        break;
      }
    }
  }

  bool checkForWin(int row, int col) {
    int color = board[row][col];

    // Check horizontally
    int count = 1;
    for (int i = col - 1; i >= 0 && board[row][i] == color; i--) count++;
    for (int i = col + 1; i < numCols && board[row][i] == color; i++) count++;
    if (count >= numToWin) return true;

    // Check vertically
    count = 1;
    for (int i = row - 1; i >= 0 && board[i][col] == color; i--) count++;
    for (int i = row + 1; i < numRows && board[i][col] == color; i++) count++;
    if (count >= numToWin) return true;

    // Check diagonally (top-left to bottom-right)
    count = 1;
    for (int i = 1;
        row - i >= 0 && col - i >= 0 && board[row - i][col - i] == color;
        i++) count++;
    for (int i = 1;
        row + i < numRows &&
            col + i < numCols &&
            board[row + i][col + i] == color;
        i++) count++;
    if (count >= numToWin) return true;

    // Check diagonally (bottom-left to top-right)
    count = 1;
    for (int i = 1;
        row + i < numRows && col - i >= 0 && board[row + i][col - i] == color;
        i++) count++;
    for (int i = 1;
        row - i >= 0 && col + i < numCols && board[row - i][col + i] == color;
        i++) count++;
    return count >= numToWin;
  }

  void resetGame() {
    setState(() {
      board = List.generate(numRows, (_) => List.filled(numCols, 0));
      isRedTurn = true;
    });
  }

  void showWinDialog(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$winner wins!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ConnectFourGame(),
  ));
}
