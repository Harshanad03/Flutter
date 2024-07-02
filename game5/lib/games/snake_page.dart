import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const int rows = 30;
  static const int totalSquares = rows * rows;
  final Random random = Random();

  List<int> snakePosition = [45, 65, 85];
  int food = 105;
  String direction = 'right';
  Timer? timer;

  @override
  void initState() {
    super.initState();
    generateFood();
    startGame();
  }

  void startGame() {
    timer = Timer.periodic(const Duration(milliseconds: 200), (Timer timer) {
      if (mounted) {
        setState(() {
          moveSnake();
          if (snakePosition.first == food) {
            snakePosition.add(snakePosition.last);
            generateFood();
          }
        });
      }
    });
  }

  void moveSnake() {
    int newHead;
    switch (direction) {
      case 'up':
        newHead = (snakePosition.first - rows) % totalSquares;
        if (newHead < 0) newHead += totalSquares;
        break;
      case 'down':
        newHead = (snakePosition.first + rows) % totalSquares;
        break;
      case 'left':
        newHead = (snakePosition.first - 1) % totalSquares;
        if (newHead < 0 || newHead % rows == rows - 1) newHead += rows;
        break;
      case 'right':
        newHead = (snakePosition.first + 1) % totalSquares;
        if (newHead % rows == 0) newHead -= rows;
        break;
      default:
        newHead = snakePosition.first;
    }

    if (snakePosition.contains(newHead)) {
      timer?.cancel();
      showGameOverDialog();
    } else {
      snakePosition.insert(0, newHead);
      snakePosition.removeLast();
    }
  }

  void generateFood() {
    food = random.nextInt(totalSquares);
    while (snakePosition.contains(food)) {
      food = random.nextInt(totalSquares);
    }
  }

  void showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: const Text('You have lost the game.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: const Text('Restart'),
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    if (mounted) {
      setState(() {
        snakePosition = [45, 65, 85];
        direction = 'right';
        generateFood();
        startGame();
      });
    }
  }

  void updateDirection(String newDirection) {
    if ((newDirection == 'up' && direction != 'down') ||
        (newDirection == 'down' && direction != 'up') ||
        (newDirection == 'left' && direction != 'right') ||
        (newDirection == 'right' && direction != 'left')) {
      if (mounted) {
        setState(() {
          direction = newDirection;
        });
      }
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Snake Game'),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: totalSquares,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: rows,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (snakePosition.contains(index)) {
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  } else if (index == food) {
                    return Container(
                      padding: const EdgeInsets.all(1),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Container(
                          color: Colors.green,
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.all(1),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Container(
                          color: Colors.grey[900],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_up),
                  onPressed: () => updateDirection('up'),
                  iconSize: 50,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_left),
                  onPressed: () => updateDirection('left'),
                  iconSize: 50,
                  color: Colors.white,
                ),
                const SizedBox(width: 50),
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_right),
                  onPressed: () => updateDirection('right'),
                  iconSize: 50,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  onPressed: () => updateDirection('down'),
                  iconSize: 50,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
