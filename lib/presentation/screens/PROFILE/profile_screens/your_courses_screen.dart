import 'package:course_ed_tech/core/widgets/build_img.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/generated/l10n.dart';
import 'package:course_ed_tech/presentation/bloc/course_bloc/course_bloc.dart';
import 'package:course_ed_tech/presentation/screens/DETAIL/PURCHAUSED_COURSES/detail_screen_purchaused_courses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YourCoursesScreen extends StatefulWidget {
  const YourCoursesScreen({super.key});

  @override
  State<YourCoursesScreen> createState() => _YourCoursesScreenState();
}

class _YourCoursesScreenState extends State<YourCoursesScreen> {
  bool showDeleteIcons = false;

  @override
  Widget build(BuildContext context) {
    final localString = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: BuildText(
          text: localString.your_courses,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: Icon(showDeleteIcons ? Icons.cancel : Icons.delete_outline),
            onPressed: () {
              setState(() {
                showDeleteIcons = !showDeleteIcons;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            if (state is CourseInitial) {
              context.read<CourseBloc>().add(
                LoadCourses(),
              ); // Загружаем курсы при старте экрана
              return const Center(child: CircularProgressIndicator());
            }

            if (state is AddedCoursesLoaded) {
              final boughtCourses = state.addedCourses;

              if (boughtCourses.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BuildImg(assetPath: 'assets/img/no_course.png'),
                      BuildText(
                        text: localString.still_no_your_courses,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      BuildText(
                        textAlign: TextAlign.center,
                        text:
                            localString
                                .click_on_the_btn_for_the_find_a_new_courses,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Навигация к экрану всех курсов
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffe3562a),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                          child: Text(
                            localString.continues,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: ListView.builder(
                  itemCount: boughtCourses.length,
                  itemBuilder: (context, index) {
                    final lang = boughtCourses[index];

                    Widget courseCard = GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder:
                                (_) =>
                                    DetailScreenPurchausedCourses(lang: lang),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 14.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffF2F2F2),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: double.infinity,
                        height: 296,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BuildImg(assetPath: lang.imgPath),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                              width: double.infinity,
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0,
                                  vertical: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BuildText(
                                      text: lang.courseTime,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff5BA092),
                                    ),
                                    BuildText(
                                      text: lang.name,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    BuildText(
                                      text: lang.description,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );

                    return showDeleteIcons
                        ? Dismissible(
                          key: ValueKey(lang.id),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            context.read<CourseBloc>().add(
                              RemoveCourse(lang),
                            ); // Удаление курса
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Course ${lang.name} removed'),
                              ),
                            );
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            margin: const EdgeInsets.symmetric(vertical: 14.0),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          child: courseCard,
                        )
                        : courseCard;
                  },
                ),
              );
            }

            return const Center(child: Text('Ошибка загрузки курсов'));
          },
        ),
      ),
    );
  }
}
