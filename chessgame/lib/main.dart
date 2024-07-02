import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ChessBoardController chessControl = ChessBoardController();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("NEDIVEIL TECHNOLOGIES")),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ChessBoard(controller: chessControl),
      ),
    );
  }
}
