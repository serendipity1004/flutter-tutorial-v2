import 'package:flutter/material.dart';
import 'package:flutter_tutorial_v2/layouts/default_layout.dart';
import 'package:flutter_tutorial_v2/topics/moor/data/database.dart';
import 'package:flutter_tutorial_v2/topics/moor/data/diary.dart';
import 'package:get_it/get_it.dart';
import 'package:moor/moor.dart' hide Column;

class WriteScreen extends StatefulWidget {
  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? title;
  String? content;
  String? tag;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              renderTextFields(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          if (this.content != null && this.title != null) {
                            final dao = GetIt.instance<DiaryDao>();

                            await dao.insertDiary(
                              DiaryCompanion(
                                title: Value(this.title!),
                                content: Value(this.content!),
                              ),
                              this.tag!,
                            );

                            Navigator.of(context).pop();
                          }
                        }
                      },
                      child: Text(
                        '저장하기',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  renderTextFields() {
    return Expanded(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: '제목',
            ),
            onSaved: (val) {
              this.title = val;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: '내용',
            ),
            maxLines: 10,
            onSaved: (val) {
              this.content = val;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: '태그',
            ),
            onSaved: (val) {
              this.tag = val;
            },
          ),
        ],
      ),
    );
  }
}
