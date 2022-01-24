import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_proj/data%20model/card_model.dart';
import 'package:todo_proj/helper.dart';

import 'mock_data.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Data data = Data();
  Helper _helper = Helper();
  List<CardModel> listOfCards = [
    CardModel(
        title: 'sssss',
        content: 'aaaaaa',
        submitDate: DateTime.now(),
        addedDate: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    _helper.readCardModel().then((list) {
      listOfCards = list;
      setState(() {});
    });

    print('>>>>>>>>>>>>>>>>>>>>>>');

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const Text(
              'ToDo or not ToDo',
            ),
            Container(
              height: 600,
              child: ListView.builder(
                  itemCount: listOfCards.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        child: Container(
                          color: Colors.grey[350],
                          child: Column(
                            children: [
                              Text(
                                listOfCards[index].title,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                listOfCards[index].content,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'added date:' +
                                        DateFormat.yMd().format(
                                            listOfCards[index].addedDate),
                                  ),
                                  Text(
                                    'submitted date:' +
                                        DateFormat.yMd().format(
                                            listOfCards[index].submitDate),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
