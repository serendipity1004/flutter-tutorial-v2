import 'package:flutter_tutorial_v2/topics/moor/data/database.dart';
import 'package:flutter_tutorial_v2/topics/moor/data/tag.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

part 'diary.g.dart';

class Diary extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 20)();

  TextColumn get content => text()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

/// diary - tag
/// one - one
/// one - many
/// many - one
/// many - many
///
/// diary - diaryWithTag - tag
/// diaryWithTag (diaryId, tagId)
class DiaryWithTag extends Table {
  IntColumn get diaryId => integer().customConstraint('REFERENCES diary(id)')();

  IntColumn get tagId => integer().customConstraint('REFERENCES tag(id)')();

  @override
  List<String> get customConstraints => ['UNIQUE (diary_id, tag_id)'];
}

class DiaryWithTagModel {
  final DiaryData diary;
  final List<TagData> tags;

  DiaryWithTagModel({
    required this.diary,
    required this.tags,
  });
}

@UseDao(tables: [Diary, Tag, DiaryWithTag])
class DiaryDao extends DatabaseAccessor<Database> with _$DiaryDaoMixin {
  DiaryDao(Database db) : super(db);

  Stream<List<DiaryWithTagModel>> streamDiariesWithTags() {
    final diariesStream = select(diary).watch();

    return diariesStream.switchMap((diaries) {
      final idToDiary = {for (var diary in diaries) diary.id: diary};

      final diaryIds = idToDiary.keys;

      final tagQuery = select(diaryWithTag).join([
        innerJoin(tag, tag.id.equalsExp(diaryWithTag.tagId)),
      ])
        ..where(diaryWithTag.diaryId.isIn(diaryIds));

      return tagQuery.watch().map((rows) {
        final idToTags = <int, List<TagData>>{};

        for (var row in rows) {
          final tags = row.readTable(tag);
          final id = row.readTable(diaryWithTag).diaryId;

          idToTags.putIfAbsent(id, () => []).add(tags);
        }

        return [
          for (var id in diaryIds)
            DiaryWithTagModel(diary: idToDiary[id]!, tags: idToTags[id]!)
        ];
      });
    });
  }

  Stream<List<DiaryData>> streamDiaries() => select(diary).watch();

  Stream<DiaryData> streamDiary(int id) =>
      (select(diary)..where((tbl) => tbl.id.equals(id))).watchSingle();

  Future insertDiary(DiaryCompanion data, String diaryTags) async {
    return transaction(() async {
      final tags = diaryTags.split(',').length > 0
          ? diaryTags.split(',')
          : [
              diaryTags,
            ];
      final tagIds = [];

      for (var diaryTag in tags) {
        final tagCompanion = TagCompanion(
          name: Value(diaryTag),
        );
        await into(tag).insert(
          tagCompanion,
          mode: InsertMode.insertOrIgnore,
        );

        final tagInst = await (select(tag)
              ..where((tbl) => tbl.name.equals(diaryTag)))
            .getSingle();

        tagIds.add(tagInst.id);
      }

      final diaryId = await into(diary).insert(data);

      for (var tagId in tagIds) {
        await into(diaryWithTag).insert(
          DiaryWithTagCompanion(
            diaryId: Value(diaryId),
            tagId: Value(tagId),
          ),
        );
      }
    });
  }
}
