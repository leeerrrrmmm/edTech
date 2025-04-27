import 'package:course_ed_tech/data/models/lessons/lessons_model.dart';
import 'package:course_ed_tech/data/models/quiz_model/quiz_model.dart';
import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';

class ProgramLanguage extends ProgramLanguageEntity {
  const ProgramLanguage({
    required super.id,
    required super.name,
    required super.description,
    required super.imgPath,
    required super.courseTime,
    required super.aboutTheCourse,
    required super.price,
    required super.lessons,
    required super.quizes,
  });

  factory ProgramLanguage.fromJson(Map<String, dynamic> json) {
    return ProgramLanguage(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imgPath: json['imgPath'],
      courseTime: json['courseTime'],
      aboutTheCourse: json['aboutTheCourse'],
      price: json['price'],
      lessons:
          (json['lessons'] as List)
              .map((e) => LessonsModel.fromJson(e))
              .toList(),
      quizes:
          (json['quizes'] as List).map((e) => QuizModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'imgPath': imgPath,
    'courseTime': courseTime,
    'aboutTheCourse': aboutTheCourse,
    'price': price,
    'lessons': lessons.map((e) => (e as LessonsModel).toJson()).toList(),
    'quizes': quizes.map((e) => (e as QuizModel).toJson()).toList(),
  };
}
