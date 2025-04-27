import 'package:course_ed_tech/domain/entities/LESSONS_FIELD_ENTITY/lessons_field.dart';

class LessonsFieldModel extends LessonsField {
  const LessonsFieldModel({
    required super.lessonFieldId,
    required super.lessonFieldVideoPath,
    required super.lessonFieldIntroduction,
  });

  factory LessonsFieldModel.fromJson(Map<String, dynamic> json) {
    return LessonsFieldModel(
      lessonFieldId: json['lessonFieldId'],
      lessonFieldVideoPath: json['lessonFieldVideoPath'],
      lessonFieldIntroduction: json['lessonFieldIntroduction'],
    );
  }

  Map<String, dynamic> toJson() => {
    'lessonFieldId': lessonFieldId,
    'lessonFieldVideoPath': lessonFieldVideoPath,
    'lessonFieldIntroduction': lessonFieldIntroduction,
  };
}
