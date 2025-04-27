import 'package:hive/hive.dart';
part 'lessons_field.g.dart';
@HiveType(typeId: 2)
class LessonsField {
  @HiveField(0)
  final int lessonFieldId;
  @HiveField(1)
  final String lessonFieldVideoPath;
  @HiveField(2)
  final String lessonFieldIntroduction;

  const LessonsField({
    required this.lessonFieldId,
    required this.lessonFieldVideoPath,
    required this.lessonFieldIntroduction,
  });
}