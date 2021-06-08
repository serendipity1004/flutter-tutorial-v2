import 'package:flutter/material.dart';
import 'package:flutter_tutorial_v2/layouts/default_layout.dart';
import 'package:flutter_tutorial_v2/topics/moor/components/diary_card.dart';
import 'package:flutter_tutorial_v2/topics/moor/data/database.dart';
import 'package:flutter_tutorial_v2/topics/moor/data/diary.dart';
import 'package:flutter_tutorial_v2/topics/moor/screens/write_screen.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    if (!GetIt.instance.isRegistered<DiaryDao>()) {
      final db = Database();

      GetIt.instance.registerSingleton<DiaryDao>(DiaryDao(db));
    }
  }

  @override
  Widget build(BuildContext context) {
    final dao = GetIt.instance<DiaryDao>();

    return DefaultLayout(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.edit,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => WriteScreen(),
            ),
          );
        },
      ),
      body: StreamBuilder<List<DiaryWithTagModel>>(
        stream: dao.streamDiariesWithTags(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;

            return ListView.separated(
                itemBuilder: (_, index) {
                  final item = data[index];

                  return DiaryCard(
                    title: item.diary.title,
                    content: item.diary.content,
                    tags: item.tags.map((e) => e.name).toList(),
                    createdAt: item.diary.createdAt,
                  );
                },
                separatorBuilder: (_, index) {
                  return Divider();
                },
                itemCount: data.length);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
