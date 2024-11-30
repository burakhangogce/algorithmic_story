import 'package:algorithmic_story/models/story_option.dart';
import 'package:algorithmic_story/models/story_question.dart';
import 'package:algorithmic_story/modules/game/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    GameController controller = context.read<GameController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      "Hikaye Adı:",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "İlk Hikaye",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 62,
                ),
                FutureBuilder<dynamic>(
                  future: controller.getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      if (controller.listData.isNotEmpty) {
                        return Consumer<GameController>(builder: (BuildContext context, controller, Widget? child) {
                          if (controller.listData.any((e) => e.id == controller.currentQuestion)) {
                            StoryQuestion item =
                                controller.listData.firstWhere((e) => e.id == controller.currentQuestion);
                            return Column(
                              children: [
                                Text(
                                  item.question,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                ListView.builder(
                                  itemCount: item.options.length,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    StoryOption option = item.options[index];
                                    return GestureDetector(
                                      onTap: () => controller.setCurrentQuestion(
                                        option.nextQuestion ?? 0,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        child: Row(
                                          children: [
                                            Text(
                                              index == 0 ? "A-) " : "B-) ",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                option.text,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          } else {
                            return const Text("Oyun Bitti!");
                          }
                        });
                      } else {
                        return const Center(child: Text("Hikaye Bulunamadı!"));
                      }
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
