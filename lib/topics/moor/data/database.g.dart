// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DiaryData extends DataClass implements Insertable<DiaryData> {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;
  DiaryData(
      {required this.id,
      required this.title,
      required this.content,
      required this.createdAt});
  factory DiaryData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return DiaryData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      content: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DiaryCompanion toCompanion(bool nullToAbsent) {
    return DiaryCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      createdAt: Value(createdAt),
    );
  }

  factory DiaryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DiaryData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DiaryData copyWith(
          {int? id, String? title, String? content, DateTime? createdAt}) =>
      DiaryData(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('DiaryData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(content.hashCode, createdAt.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DiaryData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class DiaryCompanion extends UpdateCompanion<DiaryData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime> createdAt;
  const DiaryCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DiaryCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.createdAt = const Value.absent(),
  })  : title = Value(title),
        content = Value(content);
  static Insertable<DiaryData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DiaryCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<DateTime>? createdAt}) {
    return DiaryCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiaryCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DiaryTable extends Diary with TableInfo<$DiaryTable, DiaryData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DiaryTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedDateTimeColumn createdAt = _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn('created_at', $tableName, false,
        defaultValue: Constant(DateTime.now()));
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, content, createdAt];
  @override
  $DiaryTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'diary';
  @override
  final String actualTableName = 'diary';
  @override
  VerificationContext validateIntegrity(Insertable<DiaryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiaryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DiaryData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DiaryTable createAlias(String alias) {
    return $DiaryTable(_db, alias);
  }
}

class TagData extends DataClass implements Insertable<TagData> {
  final int id;
  final String name;
  TagData({required this.id, required this.name});
  factory TagData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TagData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TagCompanion toCompanion(bool nullToAbsent) {
    return TagCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory TagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TagData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TagData copyWith({int? id, String? name}) => TagData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('TagData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TagData && other.id == this.id && other.name == this.name);
}

class TagCompanion extends UpdateCompanion<TagData> {
  final Value<int> id;
  final Value<String> name;
  const TagCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TagCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<TagData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TagCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return TagCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TagTable extends Tag with TableInfo<$TagTable, TagData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TagTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $TagTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tag';
  @override
  final String actualTableName = 'tag';
  @override
  VerificationContext validateIntegrity(Insertable<TagData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TagData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TagTable createAlias(String alias) {
    return $TagTable(_db, alias);
  }
}

class DiaryWithTagData extends DataClass
    implements Insertable<DiaryWithTagData> {
  final int diaryId;
  final int tagId;
  DiaryWithTagData({required this.diaryId, required this.tagId});
  factory DiaryWithTagData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return DiaryWithTagData(
      diaryId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}diary_id'])!,
      tagId: intType.mapFromDatabaseResponse(data['${effectivePrefix}tag_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['diary_id'] = Variable<int>(diaryId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  DiaryWithTagCompanion toCompanion(bool nullToAbsent) {
    return DiaryWithTagCompanion(
      diaryId: Value(diaryId),
      tagId: Value(tagId),
    );
  }

  factory DiaryWithTagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DiaryWithTagData(
      diaryId: serializer.fromJson<int>(json['diaryId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'diaryId': serializer.toJson<int>(diaryId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  DiaryWithTagData copyWith({int? diaryId, int? tagId}) => DiaryWithTagData(
        diaryId: diaryId ?? this.diaryId,
        tagId: tagId ?? this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('DiaryWithTagData(')
          ..write('diaryId: $diaryId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(diaryId.hashCode, tagId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DiaryWithTagData &&
          other.diaryId == this.diaryId &&
          other.tagId == this.tagId);
}

class DiaryWithTagCompanion extends UpdateCompanion<DiaryWithTagData> {
  final Value<int> diaryId;
  final Value<int> tagId;
  const DiaryWithTagCompanion({
    this.diaryId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  DiaryWithTagCompanion.insert({
    required int diaryId,
    required int tagId,
  })   : diaryId = Value(diaryId),
        tagId = Value(tagId);
  static Insertable<DiaryWithTagData> custom({
    Expression<int>? diaryId,
    Expression<int>? tagId,
  }) {
    return RawValuesInsertable({
      if (diaryId != null) 'diary_id': diaryId,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  DiaryWithTagCompanion copyWith({Value<int>? diaryId, Value<int>? tagId}) {
    return DiaryWithTagCompanion(
      diaryId: diaryId ?? this.diaryId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (diaryId.present) {
      map['diary_id'] = Variable<int>(diaryId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiaryWithTagCompanion(')
          ..write('diaryId: $diaryId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $DiaryWithTagTable extends DiaryWithTag
    with TableInfo<$DiaryWithTagTable, DiaryWithTagData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DiaryWithTagTable(this._db, [this._alias]);
  final VerificationMeta _diaryIdMeta = const VerificationMeta('diaryId');
  @override
  late final GeneratedIntColumn diaryId = _constructDiaryId();
  GeneratedIntColumn _constructDiaryId() {
    return GeneratedIntColumn('diary_id', $tableName, false,
        $customConstraints: 'REFERENCES diary(id)');
  }

  final VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedIntColumn tagId = _constructTagId();
  GeneratedIntColumn _constructTagId() {
    return GeneratedIntColumn('tag_id', $tableName, false,
        $customConstraints: 'REFERENCES tag(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [diaryId, tagId];
  @override
  $DiaryWithTagTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'diary_with_tag';
  @override
  final String actualTableName = 'diary_with_tag';
  @override
  VerificationContext validateIntegrity(Insertable<DiaryWithTagData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('diary_id')) {
      context.handle(_diaryIdMeta,
          diaryId.isAcceptableOrUnknown(data['diary_id']!, _diaryIdMeta));
    } else if (isInserting) {
      context.missing(_diaryIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DiaryWithTagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DiaryWithTagData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DiaryWithTagTable createAlias(String alias) {
    return $DiaryWithTagTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DiaryTable diary = $DiaryTable(this);
  late final $TagTable tag = $TagTable(this);
  late final $DiaryWithTagTable diaryWithTag = $DiaryWithTagTable(this);
  late final DiaryDao diaryDao = DiaryDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [diary, tag, diaryWithTag];
}
