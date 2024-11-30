import 'package:algorithmic_story/models/story_option.dart';

class StoryQuestion {
  final int id;
  final String question;
  final List<StoryOption> options;

  StoryQuestion({
    required this.id,
    required this.question,
    required this.options,
  });

  factory StoryQuestion.fromJson(Map<String, dynamic> json) {
    return StoryQuestion(
      id: json['id'],
      question: json['question'],
      options: (json['options'] as List).map((option) => StoryOption.fromJson(option)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'options': options.map((option) => option.toJson()).toList(),
    };
  }
}
