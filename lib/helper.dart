import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_proj/data%20model/card_model.dart';

class Helper {
  String cardModelKey = 'CardModel';
  late List<CardModel>? taskCards = [];

  Helper() {
    saveCardModel(
      CardModel(
        title: 'title',
        content: 'content',
        submitDate: DateTime.now(),
        addedDate: DateTime.now(),
      ),
    );
  }

  Future<void> saveCardModel(CardModel cardModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    taskCards?.add(cardModel);
    List<String> tasksEncoded =
        taskCards!.map((task) => jsonEncode(task.toJson())).toList();
    preferences.setStringList(cardModelKey, tasksEncoded);

    print(tasksEncoded);
    // Map taskCardsInMap = CardModel.
    // String taskCardsInJSON = jsonEncode(taskCards);
    // preferences.setString(cardModelKey, taskCardsInJSON);
  }

  Future<List<CardModel>> readCardModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? taskCardsInJSON = preferences.getStringList(cardModelKey);

    List<CardModel> theList = taskCardsInJSON!.map((task) {
      return CardModel.fromJson(jsonDecode(task));
    }).toList();

    return theList;
    // List tasks = jsonDecode(taskCardsInJSON!);
    // List<CardModel> listOfCardModels = tasks.map((e) {
    //   CardModel.fromMap(e);
    // }).toList();

    // List? taskCards = jsonDecode(taskCardsInJSON!) != null
    //     ? (jsonDecode(taskCardsInJSON) as List).map((e) {
    //         if (e != null) CardModel.fromJson(e);
    //       }).toList()
    //     : [
    //         CardModel(
    //             title: 'hhhhh',
    //             content: 'hhhhh',
    //             submitDate: DateTime.now(),
    //             addedDate: DateTime.now())
    //       ];
    // print(taskCards.toList());
    // return taskCards;
  }
}
