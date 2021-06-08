import 'dart:io';

import 'package:flutter_tutorial_v2/topics/moor/data/diary.dart';
import 'package:flutter_tutorial_v2/topics/moor/data/tag.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'diary.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Diary, Tag, DiaryWithTag], daos: [DiaryDao])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from == 1) {
            await m.createTable(tag);
            await m.createTable(diaryWithTag);
          }
        },
        beforeOpen: (detail) async {
          await customStatement('PRAGMA foreign_key = ON');
        },
      );
}
