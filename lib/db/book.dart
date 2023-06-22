import 'package:isar/isar.dart';

part 'book.g.dart';

@collection
class Book {
  Id id = Isar.autoIncrement;

  String? title;

  String? description;

  int? currentPage;

  String? path;
}