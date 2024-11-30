import 'package:algorithmic_story/commons/models/story_effect.dart';

class StoryOption {
  final String text;
  final int? nextQuestion;
  final List<StoryEffect> effects;

  StoryOption({
    required this.text,
    this.nextQuestion,
    required this.effects,
  });

  factory StoryOption.fromJson(Map<String, dynamic> json) {
    return StoryOption(
      text: json['text'],
      nextQuestion: json['next_question'],
      effects: (json['effects'] as List).map((effect) => StoryEffect.fromJson(effect)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'next_question': nextQuestion,
      'effects': effects.map((effect) => effect.toJson()).toList(),
    };
  }
}
