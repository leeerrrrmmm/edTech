import 'package:course_ed_tech/domain/entities/LESSONS_FIELD_ENTITY/lessons_field.dart';
import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';
import 'package:course_ed_tech/presentation/screens/LESSONS/screens/lesson_sceen.dart';
import 'package:course_ed_tech/presentation/screens/SIGNUP/sign_up.dart';
import 'package:course_ed_tech/presentation/screens/LESSONS/screens/pre_quiz_screen.dart';
import 'package:flutter/material.dart';

class DetailLessonScreen extends StatefulWidget {
  const DetailLessonScreen({
    super.key,
    required this.lang,
    required this.lessonIndex,
  });

  final ProgramLanguageEntity lang;
  final int lessonIndex;

  @override
  State<DetailLessonScreen> createState() => _DetailLessonScreenState();
}

class _DetailLessonScreenState extends State<DetailLessonScreen> {
  int currentTabIndex = 0;

  late LessonsField curLesson;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();

    curLesson = widget.lang.lessons[widget.lessonIndex].lessonsFields[0];

    screens = [
      LessonSceen(curLesson: curLesson),
      PreQuizScreen(quiz: widget.lang.quizes),
      const SignUp(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.lang.name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.lang.lessons[widget.lessonIndex].lessonName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              '${widget.lessonIndex + 1} of ${widget.lang.lessons.length}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),

          // Табы
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabItem('Lessons', 0),
                _buildTabItem('Tests', 1),
                _buildTabItem('Discuss', 2),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Контент таба
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: screens[currentTabIndex],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    final isSelected = currentTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentTabIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
