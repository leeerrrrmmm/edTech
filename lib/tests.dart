// // full_program_language_model.dart

// // ------------------- ENTITIES -------------------

// class ProgramLanguageEntity {
//   final int id;
//   final String name;
//   final String aboutTheCourse;
//   final String description;
//   final String imgPath;
//   final String courseTime;
//   final int price;
//   final List<LessonsEntity> lessons;
//   final List<QuizEntity> quizes;

//   const ProgramLanguageEntity({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.imgPath,
//     required this.courseTime,
//     required this.aboutTheCourse,
//     required this.price,
//     required this.lessons,
//     required this.quizes,
//   });
// }

// class LessonsEntity {
//   final String lessonName;
//   final List<LessonsField> lessonsFields;

//   const LessonsEntity({required this.lessonName, required this.lessonsFields});
// }

// class LessonsField {
//   final int lessonFieldId;
//   final String lessonFieldVideoPath;
//   final String lessonFieldIntroduction;

//   const LessonsField({
//     required this.lessonFieldId,
//     required this.lessonFieldVideoPath,
//     required this.lessonFieldIntroduction,
//   });
// }

// class QuizEntity {
//   final String quizNum;
//   final String quizTitle;
//   final String littleDescription;
//   final List<Question> questions;

//   const QuizEntity({
//     required this.quizNum,
//     required this.quizTitle,
//     required this.littleDescription,
//     required this.questions,
//   });
// }

// class Question {
//   final String questionText;
//   final List<String> answers;
//   final int correctAnswerIndex;

//   const Question({
//     required this.questionText,
//     required this.answers,
//     required this.correctAnswerIndex,
//   });
// }

// // ------------------- MODELS -------------------

// class ProgramLanguage extends ProgramLanguageEntity {
//   const ProgramLanguage({
//     required super.id,
//     required super.name,
//     required super.description,
//     required super.imgPath,
//     required super.courseTime,
//     required super.aboutTheCourse,
//     required super.price,
//     required super.lessons,
//     required super.quizes,
//   });

//   factory ProgramLanguage.fromJson(Map<String, dynamic> json) {
//     return ProgramLanguage(
//       id: json['id'],
//       name: json['name'],
//       description: json['description'],
//       imgPath: json['imgPath'],
//       courseTime: json['courseTime'],
//       aboutTheCourse: json['aboutTheCourse'],
//       price: json['price'],
//       lessons:
//           (json['lessons'] as List)
//               .map((e) => LessonsModel.fromJson(e))
//               .toList(),
//       quizes:
//           (json['quizes'] as List).map((e) => QuizModel.fromJson(e)).toList(),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'name': name,
//     'description': description,
//     'imgPath': imgPath,
//     'courseTime': courseTime,
//     'aboutTheCourse': aboutTheCourse,
//     'price': price,
//     'lessons': lessons.map((e) => (e as LessonsModel).toJson()).toList(),
//     'quizes': quizes.map((e) => (e as QuizModel).toJson()).toList(),
//   };
// }

// class LessonsModel extends LessonsEntity {
//   const LessonsModel({required super.lessonName, required super.lessonsFields});

//   factory LessonsModel.fromJson(Map<String, dynamic> json) {
//     return LessonsModel(
//       lessonName: json['lessonName'],
//       lessonsFields:
//           (json['lessonsFields'] as List)
//               .map((e) => LessonsFieldModel.fromJson(e))
//               .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     'lessonName': lessonName,
//     'lessonsFields':
//         lessonsFields.map((e) => (e as LessonsFieldModel).toJson()).toList(),
//   };
// }

// class LessonsFieldModel extends LessonsField {
//   const LessonsFieldModel({
//     required super.lessonFieldId,
//     required super.lessonFieldVideoPath,
//     required super.lessonFieldIntroduction,
//   });

//   factory LessonsFieldModel.fromJson(Map<String, dynamic> json) {
//     return LessonsFieldModel(
//       lessonFieldId: json['lessonFieldId'],
//       lessonFieldVideoPath: json['lessonFieldVideoPath'],
//       lessonFieldIntroduction: json['lessonFieldIntroduction'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     'lessonFieldId': lessonFieldId,
//     'lessonFieldVideoPath': lessonFieldVideoPath,
//     'lessonFieldIntroduction': lessonFieldIntroduction,
//   };
// }

// class QuizModel extends QuizEntity {
//   const QuizModel({
//     required super.quizNum,
//     required super.quizTitle,
//     required super.littleDescription,
//     required super.questions,
//   });

//   factory QuizModel.fromJson(Map<String, dynamic> json) {
//     return QuizModel(
//       quizNum: json['quizNum'],
//       quizTitle: json['quizTitle'],
//       littleDescription: json['littleDescription'],
//       questions:
//           (json['questions'] as List)
//               .map((e) => QuestionModel.fromJson(e))
//               .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     'quizNum': quizNum,
//     'quizTitle': quizTitle,
//     'littleDescription': littleDescription,
//     'questions': questions.map((e) => (e as QuestionModel).toJson()).toList(),
//   };
// }

// class QuestionModel extends Question {
//   const QuestionModel({
//     required super.questionText,
//     required super.answers,
//     required super.correctAnswerIndex,
//   });

//   factory QuestionModel.fromJson(Map<String, dynamic> json) {
//     return QuestionModel(
//       questionText: json['questionText'],
//       answers: List<String>.from(json['answers']),
//       correctAnswerIndex: json['correctAnswerIndex'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     'questionText': questionText,
//     'answers': answers,
//     'correctAnswerIndex': correctAnswerIndex,
//   };
// }
