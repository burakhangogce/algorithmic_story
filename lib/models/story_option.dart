class StoryOption {
  final String text;
  final int? nextQuestion;
  final Map<String, int> effects;

  StoryOption({
    required this.text,
    this.nextQuestion,
    required this.effects,
  });

  factory StoryOption.fromJson(Map<String, dynamic> json) {
    return StoryOption(
      text: json['text'],
      nextQuestion: json['next_question'],
      effects: Map<String, int>.from(json['effects']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'next_question': nextQuestion,
      'effects': effects,
    };
  }
}
