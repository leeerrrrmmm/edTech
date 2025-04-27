import 'package:course_ed_tech/core/widgets/build_button.dart';
import 'package:course_ed_tech/core/widgets/build_img.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';
import 'package:course_ed_tech/presentation/bloc/course_bloc/course_bloc.dart';
import 'package:course_ed_tech/presentation/bloc/saved_bloc/saved_bloc_bloc.dart';
import 'package:course_ed_tech/presentation/screens/DETAIL/PURCHAUSED_COURSES/detail_screen_purchaused_courses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.courseName,
    required this.aboutCourse,
    required this.imgPath,
    required this.price,
    required this.courseDuratuion,
    required this.lang,
  });
  final String courseName;
  final String aboutCourse;
  final String imgPath;
  final int price;
  final String courseDuratuion;
  final ProgramLanguageEntity lang;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BuildText(
          text: widget.courseName,
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSaved = !isSaved;
              });

              if (isSaved) {
                context.read<SavedBloc>().add(AddSavedCourse(widget.lang));
              } else {
                context.read<SavedBloc>().add(RemoveSavedCourse(widget.lang));
              }
            },
            icon: Icon(
              isSaved == false ? Icons.bookmark_border : Icons.bookmark,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // IMG
            BuildImg(assetPath: widget.imgPath),
            // PRICE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [_buildPriceContainer(widget.price)],
                    ),
                  ),
                  // ABOUT THE COURSE
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: BuildText(
                      text: 'About the course',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // COURSE DESCRIPTION
                  BuildText(
                    textAlign: TextAlign.start,
                    text: widget.aboutCourse,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  // DURATION
                  BuildText(
                    text: 'Duration',
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  // DURATION TIME
                  BuildText(
                    text: widget.courseDuratuion,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                bool courseAdded = false;
                if (state is AddedCoursesLoaded) {
                  courseAdded = state.addedCourses.any(
                    (el) => el.name == widget.lang.name,
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33.0),
                  child: BuildButton(
                    onTap: () {
                      if (!courseAdded) {
                        context.read<CourseBloc>().add(
                          AddCourse(widget.lang),
                        ); // Add course to cart
                      } else {
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                            builder:
                                (context) => DetailScreenPurchausedCourses(
                                  lang: widget.lang,
                                ),
                          ),
                        ); // Navigate to purchased course detail screen
                      }
                    },
                    text: !courseAdded ? 'Add to cart' : 'Open Course',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.white,
                    color: Color(0xffE3562A),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Price display container
  Container _buildPriceContainer(final int coursePrice) {
    return Container(
      width: 63,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          '\$${coursePrice.toString()}',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
