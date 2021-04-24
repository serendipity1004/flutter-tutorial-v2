import 'package:hive/hive.dart';

part 'word_model.g.dart';

@HiveType(typeId: 1)
class WordModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String engWord;

  @HiveField(2)
  final String korWord;

  @HiveField(3)
  final int correctCount;

  WordModel({
    required this.id,
    required this.engWord,
    required this.korWord,
    required this.correctCount,
  });
}
