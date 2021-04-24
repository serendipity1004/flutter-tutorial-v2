import 'package:flutter/material.dart';
import 'package:flutter_tutorial_v2/layouts/default_layout.dart';
import 'package:flutter_tutorial_v2/topics/hive/component/word_card.dart';
import 'package:flutter_tutorial_v2/topics/hive/model/word_model.dart';
import 'package:flutter_tutorial_v2/topics/hive/screen/add.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddScreen(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ValueListenableBuilder(
            valueListenable: Hive.box<WordModel>('word').listenable(),
            builder: (context, Box<WordModel> box, child) {
              return ListView.separated(
                itemBuilder: (_, index) {
                  final item = box.getAt(index);

                  if (item == null) {
                    return Container(
                      child: Text('아이템이 존재하지 않습니다.'),
                    );
                  } else {
                    return WordCard(
                      onBodyTap: () {
                        Get.snackbar(item.engWord, item.korWord);
                      },
                      onCheckTap: () {
                        final newModel = WordModel(
                          id: item.id,
                          engWord: item.engWord,
                          korWord: item.korWord,
                          correctCount: item.correctCount + 1,
                        );

                        box.put(
                          item.id,
                          newModel,
                        );
                      },
                      engWord: item.engWord,
                      korWord: item.korWord,
                      correctCount: item.correctCount,
                    );
                  }
                },
                separatorBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(),
                  );
                },
                itemCount: box.length,
              );
            }),
      ),
    );
  }
}
