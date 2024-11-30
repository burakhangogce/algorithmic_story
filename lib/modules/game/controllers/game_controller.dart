import 'dart:convert';
import 'package:algorithmic_story/models/story_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameController extends ChangeNotifier {
  int currentQuestion = 1;
  setCurrentQuestion(int value) {
    currentQuestion = value;
    notifyListeners();
  }

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
