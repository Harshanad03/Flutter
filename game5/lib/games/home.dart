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
      case 'Stone Paper':
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
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Games For You!",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.blue.shade50,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade100,
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(3, 3),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(-3, -3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search your favorite game",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Get Recommendations Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 77, 186, 237),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                shadowColor: Colors.blue.shade200,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                "Get Your Favorite Games",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // Title for Recommendations
            const Text(
              "Our Recommendations",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // List of Games
            Expanded(
              child: ListView(
                children: [
                  _buildGameTile(context, "2048"),
                  _buildGameTile(context, "Memory Game"),
                  _buildGameTile(context, "Stone Paper"),
                  _buildGameTile(context, "Tic Tac Toe"),
                  _buildGameTile(context, "Snake"),
                  _buildGameTile(context, "Connect"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build each game tile
  Widget _buildGameTile(BuildContext context, String gameName) {
    return GestureDetector(
      onTap: () => _navigateToGame(context, gameName),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade100,
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.lightBlue.shade100,
              child: Text(
                (gameName[0]),
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              gameName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
