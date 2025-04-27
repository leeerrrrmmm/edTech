import 'package:hive/hive.dart';

part 'question_entity.g.dart';

@HiveType(typeId: 4)
class Question {
  @HiveField(0)
  final String questionText;
  @HiveField(1)
  final List<String> answers;
  @HiveField(2)
  final int correctAnswerIndex;

  const Question({
    required this.questionText,
    required this.answers,
    required this.correctAnswerIndex,
  });
}
