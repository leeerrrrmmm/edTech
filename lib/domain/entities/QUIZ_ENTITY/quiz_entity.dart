import 'package:course_ed_tech/domain/entities/QUESTION_ENTITY/question_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'quiz_entity.g.dart';

@HiveType(typeId: 3)
class QuizEntity {
  @HiveField(0)
  final String quizNum;
  @HiveField(1)
  final String quizTitle;
  @HiveField(2)
  final String littleDescription;
  @HiveField(3)
  final List<Question> questions;
  @HiveField(4)
  const QuizEntity({
    required this.quizNum,
    required this.quizTitle,
    required this.littleDescription,
    required this.questions,
  });
}
