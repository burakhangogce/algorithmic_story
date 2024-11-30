import 'package:algorithmic_story/modules/game/controllers/game_controller.dart';
import 'package:algorithmic_story/modules/game/screens/game_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider(
                    create: (context) => GameController(),
                    child: const GamePage(),
                  ),
                ),
              );
            },
            child: const Text("Oyuna Başla"),
          ),
        ),
      ),
    );
  }
}
