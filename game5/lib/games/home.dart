import 'package:flutter/material.dart';

import 'package:game5/games/memory_game_page.dart';
import 'package:game5/games/Game2048.dart';
import 'package:game5/games/snake_page.dart';
import 'package:game5/games/stone_paper_page.dart';
import 'package:game5/games/connect_page.dart';
import 'package:game5/games/tic_tac_toe_page.dart snake_page.dart';

class HomePage extends StatelessWidget {
  void _navigateToGame(BuildContext context, String gameName) {
    switch (gameName) {
      case '2048':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Game2048()));
        break;
      case 'Memory Game':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MemoryGame()));
        break;
      case 'Stone paper':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RockPaperScissorsGame()));
        break;
      case 'Tic Tac Toe':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TicTacToe()));
        break;
      case 'Snake':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
        break;
      case 'Connect':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ConnectFourGame()));
        break;
      // Add cases for other games similarly
      default:
        break;
    }
  }

  Widget _buildContainer(
      BuildContext context, String containerName, Color color) {
    return GestureDetector(
      onTap: () => _navigateToGame(context, containerName),
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 156, 161, 161),
              Color.fromARGB(255, 97, 222, 231),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 242, 238, 238).withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            containerName,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Center(
          child: Text(
            "Games",
            style: TextStyle(color: Color.fromARGB(255, 7, 7, 7)),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 250, 248, 248),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildContainer(context, '2048', Colors.red),
                  ),
                  Expanded(
                    child:
                        _buildContainer(context, 'Memory Game', Colors.green),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildContainer(context, 'Stone paper', Colors.blue),
                  ),
                  Expanded(
                    child:
                        _buildContainer(context, 'Tic Tac Toe', Colors.orange),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildContainer(context, 'Snake', Colors.purple),
                  ),
                  Expanded(
                    child: _buildContainer(context, 'Connect', Colors.teal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
