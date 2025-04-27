import 'package:course_ed_tech/core/widgets/build_button_with_border.dart';
import 'package:course_ed_tech/core/widgets/build_img.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/domain/entities/QUIZ_ENTITY/quiz_entity.dart';
import 'package:course_ed_tech/presentation/screens/LESSONS/screens/test_quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreQuizScreen extends StatelessWidget {
  const PreQuizScreen({super.key, required this.quiz});
  final List<QuizEntity> quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: quiz.length,
        itemBuilder: (context, index) {
          final curQuiz = quiz[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                width: double.infinity,
                height: 463,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: <Widget>[
                    BuildImg(assetPath: 'assets/img/quix.png'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildText(
                          text: curQuiz.quizNum,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffe3562a),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: BuildText(
                            text: curQuiz.quizTitle,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        BuildText(
                          text: curQuiz.littleDescription,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: BuildButtonWithBorder(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder:
                                      (context) => QuizScreen(
                                        questions: curQuiz.questions,
                                      ),
                                ),
                              );
                            },
                            text: 'Begin',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            textColor: Colors.black87,
                            borderColor: Color(0xffe3562a),
                            borderWidth: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
