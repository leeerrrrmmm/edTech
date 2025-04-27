import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/domain/entities/LESSONS_FIELD_ENTITY/lessons_field.dart';
import 'package:flutter/material.dart';

class LessonSceen extends StatelessWidget {
  const LessonSceen({super.key, required this.curLesson});
  final LessonsField curLesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 194,
                decoration: BoxDecoration(color: Color(0xffe6edf4)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: BuildText(
                        text: 'Introducion',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BuildText(
                      text: curLesson.lessonFieldIntroduction,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
