import 'package:course_ed_tech/data/models/quiz_model/question_model.dart';
import 'package:course_ed_tech/domain/entities/QUIZ_ENTITY/quiz_entity.dart';

class QuizModel extends QuizEntity {
  const QuizModel({
    required super.quizNum,
    required super.quizTitle,
    required super.littleDescription,
    required super.questions,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      quizNum: json['quizNum'],
      quizTitle: json['quizTitle'],
      littleDescription: json['littleDescription'],
      questions:
          (json['questions'] as List)
              .map((e) => QuestionModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'quizNum': quizNum,
    'quizTitle': quizTitle,
    'littleDescription': littleDescription,
    'questions': questions.map((e) => (e as QuestionModel).toJson()).toList(),
  };
}