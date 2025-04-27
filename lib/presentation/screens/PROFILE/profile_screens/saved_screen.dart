import 'package:course_ed_tech/core/widgets/build_button.dart';
import 'package:course_ed_tech/core/widgets/build_img.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/generated/l10n.dart';
import 'package:course_ed_tech/presentation/bloc/saved_bloc/saved_bloc_bloc.dart';
import 'package:course_ed_tech/presentation/screens/DETAIL/PURCHAUSED_COURSES/detail_screen_purchaused_courses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  bool showDeleteIcons = false;

  @override
  Widget build(BuildContext context) {
    final localString = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: BuildText(
          text: 'Saved',
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showDeleteIcons = !showDeleteIcons;
              });
            },
            icon: Icon(showDeleteIcons ? Icons.cancel : Icons.delete_outline),
          ),
        ],
      ),

      body: SafeArea(
        child: BlocBuilder<SavedBloc, SavedBlocState>(
          builder: (context, state) {
            if (state is SavedBlocInitial) {
              context.read<SavedBloc>().add(LoadSavedCourses());
            }
            if (state is SavedCourseLoading) {
              return Center(child: CircularProgressIndicator.adaptive());
            }

            if (state is SavedCourseLoaded) {
              final savedCourses = state.savedCourses;

              if (savedCourses.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // TODO если нет сохраненных курсов отображать одно -> если есть отобразим сами курсы
                    // IMG IF COURSE NOT SAVED
                    BuildImg(assetPath: 'assets/img/not_saved.png'),
                    // NOT SAVED TEXT
                    BuildText(
                      text: localString.course_not_saved,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    // TRY SAVE COURSE TEXT
                    BuildText(
                      textAlign: TextAlign.center,
                      text: localString.try_save_the_course,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 40),
                    // CONTINUE BUTTON
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: BuildButton(
                        onTap: () {
                          //TODO ЛОГИКА ПЕРЕХОДА НА ЕКРАН С КУРСАМИ
                        },
                        text: localString.continues,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        textColor: Colors.white,
                        color: Color(0xffe3562a),
                      ),
                    ),
                  ],
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: ListView.builder(
                  itemCount: savedCourses.length,
                  itemBuilder: (context, index) {
                    final lang = savedCourses[index];

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
                            context.read<SavedBloc>().add(
                              RemoveSavedCourse(lang),
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
