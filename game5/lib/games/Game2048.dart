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
          widget.gridSize, (i) => List<int>.filled(widget.gridSize, 0));
      addRandomTile();
      addRandomTile();
    });
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

  void handleMove(String direction) {
    bool moved = false;
    switch (direction) {
      case 'left':
        moved = _moveLeft();
        break;
      case 'right':
        moved = _moveRight();
        break;
      case 'up':
        moved = _moveUp();
        break;
      case 'down':
        moved = _moveDown();
        break;
    }
    if (moved) {
      setState(() {
        addRandomTile();
      });
    }
  }

  bool _moveLeft() {
    bool moved = false;
    for (int i = 0; i < widget.gridSize; i++) {
      List<int> row = grid[i];
      List<int> newRow = _mergeTiles(row);
      if (row != newRow) moved = true;
      grid[i] = newRow;
    }
    return moved;
  }

  bool _moveRight() {
    bool moved = false;
    for (int i = 0; i < widget.gridSize; i++) {
      List<int> row = grid[i].reversed.toList();
      List<int> newRow = _mergeTiles(row).reversed.toList();
      if (row != newRow.reversed.toList()) moved = true;
      grid[i] = newRow;
    }
    return moved;
  }

  bool _moveUp() {
    bool moved = false;
    for (int i = 0; i < widget.gridSize; i++) {
      List<int> column = [for (int j = 0; j < widget.gridSize; j++) grid[j][i]];
      List<int> newColumn = _mergeTiles(column);
      if (column != newColumn) moved = true;
      for (int j = 0; j < widget.gridSize; j++) {
        grid[j][i] = newColumn[j];
      }
    }
    return moved;
  }

  bool _moveDown() {
    bool moved = false;
    for (int i = 0; i < widget.gridSize; i++) {
      List<int> column = [for (int j = 0; j < widget.gridSize; j++) grid[j][i]]
          .reversed
          .toList();
      List<int> newColumn = _mergeTiles(column).reversed.toList();
      if (column != newColumn.reversed.toList()) moved = true;
      for (int j = 0; j < widget.gridSize; j++) {
        grid[j][i] = newColumn[j];
      }
    }
    return moved;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Center(child: Text('2048 Game')),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildGameBoard(),
            const SizedBox(height: 20),
            _buildControlButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildGameBoard() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 51, 51, 51),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: List.generate(widget.gridSize, (i) {
          return Row(
            children: List.generate(widget.gridSize, (j) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  height: 70,
                  decoration: BoxDecoration(
                    color: _getTileColor(grid[i][j]),
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
    );
  }

  Widget _buildControlButtons() {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_up),
          onPressed: () => handleMove('up'),
          iconSize: 50,
          color: Colors.black,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () => handleMove('left'),
              iconSize: 50,
              color: Colors.black,
            ),
            const SizedBox(width: 50),
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_right),
              onPressed: () => handleMove('right'),
              iconSize: 50,
              color: Colors.black,
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () => handleMove('down'),
          iconSize: 50,
          color: Colors.black,
        ),
      ],
    );
  }

  Color _getTileColor(int value) {
    switch (value) {
      case 2:
        return Colors.blue[300]!;
      case 4:
        return Colors.green[300]!;
      case 8:
        return Colors.yellow[300]!;
      case 16:
        return Colors.orange[300]!;
      case 32:
        return Colors.red[300]!;
      case 64:
        return Colors.purple[300]!;
      case 128:
        return Colors.teal[300]!;
      default:
        return const Color.fromARGB(255, 201, 197, 197)!;
    }
  }
}
