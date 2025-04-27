import 'package:course_ed_tech/domain/entities/QUESTION_ENTITY/question_entity.dart';

class QuestionModel extends Question {
  const QuestionModel({
    required super.questionText,
    required super.answers,
    required super.correctAnswerIndex,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      questionText: json['questionText'],
      answers: List<String>.from(json['answers']),
      correctAnswerIndex: json['correctAnswerIndex'],
    );
  }

  Map<String, dynamic> toJson() => {
    'questionText': questionText,
    'answers': answers,
    'correctAnswerIndex': correctAnswerIndex,
  };
}
