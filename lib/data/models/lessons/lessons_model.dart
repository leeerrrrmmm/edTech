import 'package:course_ed_tech/data/models/lessons/lesson_fields_model.dart';
import 'package:course_ed_tech/domain/entities/LESSON_ENTITY/lessons_entity.dart';

class LessonsModel extends LessonsEntity {
  const LessonsModel({required super.lessonName, required super.lessonsFields});

  factory LessonsModel.fromJson(Map<String, dynamic> json) {
    return LessonsModel(
      lessonName: json['lessonName'],
      lessonsFields:
          (json['lessonsFields'] as List)
              .map((e) => LessonsFieldModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'lessonName': lessonName,
    'lessonsFields':
        lessonsFields.map((e) => (e as LessonsFieldModel).toJson()).toList(),
  };
}
