import 'package:flutter/material.dart';
import 'package:game5/games/home.dart';

import 'package:game5/games/memory_game_page.dart';
import 'package:game5/games/Game2048.dart';
import 'package:game5/games/snake_page.dart';
import 'package:game5/games/stone_paper_page.dart';
import 'package:game5/games/connect_page.dart';
import 'package:game5/games/tic_tac_toe_page.dart snake_page.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
