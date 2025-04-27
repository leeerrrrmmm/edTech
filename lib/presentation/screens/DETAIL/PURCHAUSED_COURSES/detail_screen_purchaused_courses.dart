import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';
import 'package:course_ed_tech/presentation/screens/LESSONS/detail_lessons_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreenPurchausedCourses extends StatelessWidget {
  const DetailScreenPurchausedCourses({super.key, required this.lang});

  final ProgramLanguageEntity lang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lang.name), centerTitle: true),
      body: ListView.builder(
        itemCount: lang.lessons.length,
        itemBuilder: (context, index) {
          final lessons = lang.lessons[index];
          return GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder:
                        (context) =>
                            DetailLessonScreen(lang: lang, lessonIndex: index),
                  ),
                ),
            child: ListTile(title: Text(lessons.lessonName)),
          );
        },
      ),
    );
  }
}
