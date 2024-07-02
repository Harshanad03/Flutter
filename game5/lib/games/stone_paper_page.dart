import 'dart:math';
import 'package:flutter/material.dart';



class RockPaperScissorsGame extends StatefulWidget {
  const RockPaperScissorsGame({super.key});

  @override
  _RockPaperScissorsGameState createState() => _RockPaperScissorsGameState();
}

class _RockPaperScissorsGameState extends State<RockPaperScissorsGame> {
  static const List<String> choices = ['Rock', 'Paper', 'Scissors'];
  String playerChoice = '';
  String computerChoice = '';
  String result = '';

  void playGame(String choice) {
    final Random random = Random();
    playerChoice = choice;
    computerChoice = choices[random.nextInt(choices.length)];
    result = getResult(playerChoice, computerChoice);

    setState(() {});
  }

  String getResult(String player, String computer) {
    if (player == computer) {
      return "It's a Draw!";
    } else if ((player == 'Rock' && computer == 'Scissors') ||
        (player == 'Paper' && computer == 'Rock') ||
        (player == 'Scissors' && computer == 'Paper')) {
      return 'You Win!';
    } else {
      return 'You Lose!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Rock, Paper, Scissors'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Choice: $playerChoice',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Computer\'s Choice: $computerChoice',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              result,
              style: const TextStyle(fontSize: 28, color: Colors.yellow),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildChoiceButton('Rock'),
                const SizedBox(width: 10),
                _buildChoiceButton('Paper'),
                const SizedBox(width: 10),
                _buildChoiceButton('Scissors'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  playerChoice = '';
                  computerChoice = '';
                  result = '';
                });
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceButton(String choice) {
    return ElevatedButton(
      onPressed: () => playGame(choice),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: const TextStyle(fontSize: 20),
      ),
      child: Text(choice),
    );
  }
}