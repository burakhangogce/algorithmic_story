class StoryEffect {
  final int attribute;
  final int value;

  StoryEffect({
    required this.attribute,
    required this.value,
  });

  factory StoryEffect.fromJson(Map<String, dynamic> json) {
    return StoryEffect(
      attribute: json['attribute'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'attribute': attribute,
      'value': value,
    };
  }
}
