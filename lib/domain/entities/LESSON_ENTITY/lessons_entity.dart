import 'package:course_ed_tech/domain/entities/LESSONS_FIELD_ENTITY/lessons_field.dart';
import 'package:hive/hive.dart';

part 'lessons_entity.g.dart';

@HiveType(typeId: 1)
class LessonsEntity {
  @HiveField(0)
  final String lessonName;
  @HiveField(1)
  final List<LessonsField> lessonsFields;

  const LessonsEntity({required this.lessonName, required this.lessonsFields});
}
