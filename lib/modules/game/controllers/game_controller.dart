import 'dart:convert';
import 'package:algorithmic_story/enums/character_attribute.dart';
import 'package:algorithmic_story/models/story_option.dart';
import 'package:algorithmic_story/models/story_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameController extends ChangeNotifier {
  int currentQuestion = 1;
  answer(StoryOption value) {
    currentQuestion = value.nextQuestion!;
    for (var item in value.effects) {
      attributes[attributes.keys.singleWhere((e) => attributeValues[e] == item.attribute)] =
          (attributes[attributes.keys.singleWhere((e) => attributeValues[e] == item.attribute)]! + item.value);
    }
    notifyListeners();
  }

  Map<CharacterAttribute, int> attributes = {
    CharacterAttribute.diplomacy: 0,
    CharacterAttribute.courage: 0,
    CharacterAttribute.leadership: 0,
    CharacterAttribute.empathy: 0,
    CharacterAttribute.strategicThinking: 0,
    CharacterAttribute.economicForesight: 0,
    CharacterAttribute.independence: 0,
  };

  List<StoryQuestion> listData = [];
  Future<List<StoryQuestion>> getData() async {
    listData = [];
    String jsonString = await rootBundle.loadString("assets/storys/first_story.json");
    final jsonDataParsed = jsonDecode(jsonString);
    if (jsonDataParsed != null) {
      listData = (jsonDataParsed as List).map((question) => StoryQuestion.fromJson(question)).toList();
      return listData;
    }
    return listData;
  }
}
