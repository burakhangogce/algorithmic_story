import 'package:algorithmic_story/commons/widgets/platform_spesific_action_sheet.dart';
import 'package:algorithmic_story/modules/boarding/controllers/boarding_controller.dart';
import 'package:algorithmic_story/modules/game/controllers/game_controller.dart';
import 'package:algorithmic_story/modules/game/screens/game_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    BoardingController controller = context.read<BoardingController>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<dynamic>(
            future: controller.getFolderNames(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                if (controller.folderNames.isNotEmpty) {
                  return TextButton(
                    onPressed: () async {
                      await PlatformSpesificActionSheet(
                        cancelButtonText: '',
                        items: controller.folderNames,
                      ).showActionSheet(context).then((v) {
                        if (context.mounted && v != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider(
                                create: (context) => GameController(),
                                child: GamePage(
                                  gamePath: controller.folderNames[v],
                                ),
                              ),
                            ),
                          );
                        }
                      });
                    },
                    child: const Text("Oyuna Başla"),
                  );
                } else {
                  return const Center(child: Text("Hikaye Bulunamadı!"));
                }
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
