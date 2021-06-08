import 'package:flutter/material.dart';
import 'package:flutter_tutorial_v2/layouts/default_layout.dart';
import 'package:flutter_tutorial_v2/topics/hive/model/word_model.dart';
import 'package:hive/hive.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String engWord = '';
  String korWord = '';

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextField(
                    onChanged: (val) {
                      engWord = val;
                    },
                    decoration: InputDecoration(
                      labelText: '영어 단어',
                    ),
                  ),
                  TextField(
                    onChanged: (val) {
                      korWord = val;
                    },
                    decoration: InputDecoration(
                      labelText: '한글 단어',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final box = Hive.box<WordModel>('word');

                      int id = 0;

                      if (box.isNotEmpty) {
                        final prevItem = box.getAt(box.length - 1);

                        if (prevItem != null) {
                          id = prevItem.id + 1;
                        }
                      }

                      box.put(
                        id,
                        WordModel(
                          id: id,
                          engWord: engWord,
                          korWord: korWord,
                          correctCount: 0,
                        ),
                      );

                      Navigator.of(context).pop();
                    },
                    child: Text('저장'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
