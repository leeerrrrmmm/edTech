import 'package:course_ed_tech/domain/entities/LESSON_ENTITY/lessons_entity.dart';
import 'package:course_ed_tech/domain/entities/QUIZ_ENTITY/quiz_entity.dart';
import 'package:hive/hive.dart';

part 'program_language_entity.g.dart';

@HiveType(typeId: 0)
class ProgramLanguageEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String aboutTheCourse;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String imgPath;
  @HiveField(5)
  final String courseTime;
  @HiveField(6)
  final int price;
  @HiveField(7)
  final List<LessonsEntity> lessons;
  @HiveField(8)
  final List<QuizEntity> quizes;
  @HiveField(9)
  const ProgramLanguageEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imgPath,
    required this.courseTime,
    required this.aboutTheCourse,
    required this.price,
    required this.lessons,
    required this.quizes,
  });
}
