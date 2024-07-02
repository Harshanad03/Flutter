import 'dart:math';
import 'package:flutter/material.dart';

class Game2048 extends StatefulWidget {
  final int gridSize;

  const Game2048({Key? key, this.gridSize = 4}) : super(key: key);

  @override
  _Game2048State createState() => _Game2048State();
}

class _Game2048State extends State<Game2048> {
  late List<List<int>> grid;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    resetGame();
  }

  void addRandomTile() {
    List<Point<int>> emptyTiles = [];
    for (int i = 0; i < widget.gridSize; i++) {
      for (int j = 0; j < widget.gridSize; j++) {
        if (grid[i][j] == 0) {
          emptyTiles.add(Point(i, j));
        }
      }
    }
    if (emptyTiles.isNotEmpty) {
      Point<int> randomTile = emptyTiles[random.nextInt(emptyTiles.length)];
      grid[randomTile.x][randomTile.y] = random.nextBool() ? 2 : 4;
    }
  }

  void resetGame() {
    setState(() {
      grid = List.generate(
          widget.gridSize, (_) => List.generate(widget.gridSize, (_) => 0));
      addRandomTile();
      addRandomTile();
    });
  }

  bool moveLeft() {
    bool moved = false;
    for (int i = 0; i < widget.gridSize; i++) {
      List<int> row = grid[i];
      List<int> newRow = _mergeTiles(row);
      if (!moved && !_listEquals(row, newRow)) moved = true;
      grid[i] = newRow;
    }
    return moved;
  }

  bool moveRight() {
    bool moved = false;
    for (int i = 0; i < widget.gridSize; i++) {
      List<int> row = grid[i].reversed.toList();
      List<int> newRow = _mergeTiles(row).reversed.toList();
      if (!moved && !_listEquals(row, newRow.reversed.toList())) moved = true;
      grid[i] = newRow;
    }
    return moved;
  }

  bool moveUp() {
    bool moved = false;
    for (int i = 0; i < widget.gridSize; i++) {
      List<int> column = [for (int j = 0; j < widget.gridSize; j++) grid[j][i]];
      List<int> newColumn = _mergeTiles(column);
      if (!moved && !_listEquals(column, newColumn)) moved = true;
      for (int j = 0; j < widget.gridSize; j++) {
        grid[j][i] = newColumn[j];
      }
    }
    return moved;
  }

  bool moveDown() {
    bool moved = false;
    for (int i = 0; i < widget.gridSize; i++) {
      List<int> column = [for (int j = 0; j < widget.gridSize; j++) grid[j][i]]
          .reversed
          .toList();
      List<int> newColumn = _mergeTiles(column).reversed.toList();
      if (!moved && !_listEquals(column, newColumn.reversed.toList()))
        moved = true;
      for (int j = 0; j < widget.gridSize; j++) {
        grid[j][i] = newColumn[j];
      }
    }
    return moved;
  }

  List<int> _mergeTiles(List<int> tiles) {
    List<int> newTiles = tiles.where((tile) => tile != 0).toList();
    for (int i = 0; i < newTiles.length - 1; i++) {
      if (newTiles[i] == newTiles[i + 1]) {
        newTiles[i] *= 2;
        newTiles[i + 1] = 0;
      }
    }
    newTiles = newTiles.where((tile) => tile != 0).toList();
    return List<int>.filled(widget.gridSize, 0)
      ..setRange(0, newTiles.length, newTiles);
  }

  bool _listEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  void handleMove(String direction) {
    bool moved = false;
    switch (direction) {
      case 'left':
        moved = moveLeft();
        break;
      case 'right':
        moved = moveRight();
        break;
      case 'up':
        moved = moveUp();
        break;
      case 'down':
        moved = moveDown();
        break;
    }
    if (moved) {
      setState(() {
        addRandomTile();
      });
    }
  }

  bool canMove() {
    for (int i = 0; i < widget.gridSize; i++) {
      for (int j = 0; j < widget.gridSize; j++) {
        if (grid[i][j] == 0) return true;
        if (i > 0 && grid[i][j] == grid[i - 1][j]) return true;
        if (i < widget.gridSize - 1 && grid[i][j] == grid[i + 1][j])
          return true;
        if (j > 0 && grid[i][j] == grid[i][j - 1]) return true;
        if (j < widget.gridSize - 1 && grid[i][j] == grid[i][j + 1])
          return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Center(child: Text('2048 Game')),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 255, 255)!,
                    const Color.fromARGB(255, 255, 253, 253)!
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: List.generate(widget.gridSize, (i) {
                  return Row(
                    children: List.generate(widget.gridSize, (j) {
                      return Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: grid[i][j] == 0
                                ? const Color.fromARGB(255, 10, 10, 10)
                                : Colors.greenAccent[grid[i][j] % 8 * 100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              grid[i][j] == 0 ? '' : '${grid[i][j]}',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildArrowButton(Icons.arrow_upward, 'up'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildArrowButton(Icons.arrow_back, 'left'),
                      const SizedBox(width: 30),
                      _buildArrowButton(Icons.arrow_forward, 'right'),
                    ],
                  ),
                  _buildArrowButton(Icons.arrow_downward, 'down'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArrowButton(IconData icon, String direction) {
    return ElevatedButton(
      onPressed: () => handleMove(direction),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.grey[800], // Button color
        foregroundColor: Colors.white, // Icon color
      ),
      child: Icon(icon),
    );
  }
}
