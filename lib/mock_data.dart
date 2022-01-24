import 'package:flutter/cupertino.dart';
import 'package:todo_proj/data%20model/card_model.dart';
import 'package:todo_proj/helper.dart';

class Data extends ChangeNotifier {
  setListOfCards(List<CardModel> list) {
    listOfCards = list;
    notifyListeners();
  }

  List<CardModel> listOfCards = [];
  Helper _helper = Helper();

  getDataFromSharedPreferences() {
    _helper.readCardModel().then((list) {
      print('our list in Data class, ');
      setListOfCards(list);
    });
  }
}
