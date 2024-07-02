import 'package:flutter/material.dart';

import 'dart:math';

class MemoryGame extends StatefulWidget {
  const MemoryGame({super.key});

  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  List<String> _cards = [
    '🍎',
    '🍌',
    '🍇',
    '🍉',
    '🍓',
    '🍒',
    '🍍',
    '🍑',
    '🍎',
    '🍌',
    '🍇',
    '🍉',
    '🍓',
    '🍒',
    '🍍',
    '🍑',
  ];
  List<bool> _revealed = List.filled(16, false);
  int? _firstPick;
  int? _secondPick;
  bool _waiting = false;

  @override
  void initState() {
    super.initState();
    _cards.shuffle(Random());
  }

  void _resetGame() {
    setState(() {
      _cards.shuffle(Random());
      _revealed = List.filled(16, false);
      _firstPick = null;
      _secondPick = null;
      _waiting = false;
    });
  }

  void _checkWin() {
    if (_revealed.every((element) => element)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Congratulations!'),
            content: const Text('You have matched all pairs!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _resetGame();
                },
                child: const Text('Restart'),
              ),
            ],
          );
        },
      );
    }
  }

  void _pickCard(int index) {
    if (_waiting || _revealed[index]) return;

    setState(() {
      if (_firstPick == null) {
        _firstPick = index;
        _revealed[index] = true;
      } else if (_secondPick == null) {
        _secondPick = index;
        _revealed[index] = true;
        _waiting = true;

        if (_cards[_firstPick!] == _cards[_secondPick!]) {
          _firstPick = null;
          _secondPick = null;
          _waiting = false;
          _checkWin();
        } else {
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _revealed[_firstPick!] = false;
              _revealed[_secondPick!] = false;
              _firstPick = null;
              _secondPick = null;
              _waiting = false;
            });
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Center(child: Text('Memory Game')),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetGame,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
              height: 40), // Add space between the AppBar and the GridView
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 16,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _pickCard(index),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey.withOpacity(0.5),
                          Colors.grey.withOpacity(0.3),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        _revealed[index] ? _cards[index] : '',
                        style:
                            const TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
