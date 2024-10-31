import 'package:hive/hive.dart';

// I can't use the id of this class to another class

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject // my class extends HiveObject

{
  // give a unique id to each field
  // each id is unique per class
  // I can't use the same id for different fields in the same class

  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final String
      date; // String not a date time object because date time object will need another type adapter then register it
  @HiveField(3)
  final int
      color; // The same case of the  date field, I need to convert it to int because Hive doesn't support color type

  NoteModel(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.color});
}
