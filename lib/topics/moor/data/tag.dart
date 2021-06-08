import 'package:moor/moor.dart';

class Tag extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 20)();

  @override
  List<String> get customConstraints => ['UNIQUE (name)'];
}
