import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';
import 'package:course_ed_tech/presentation/bloc/course_bloc/course_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Загружаем курсы при старте экрана
    Future.delayed(Duration.zero, () {
      context.read<CourseBloc>().add(LoadCourses());
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Courses')),
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AddedCoursesLoaded) {
            final courses = state.addedCourses;

            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return ListTile(
                  title: Text(course.name),
                  subtitle: Text(course.description),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      context.read<CourseBloc>().add(RemoveCourse(course));
                    },
                  ),
                  onTap: () {
                    // Действие по тапу
                  },
                );
              },
            );
          } else if (state is CourseError) {
            return const Center(child: Text('An error occurred'));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Добавление нового курса
          final newCourse = ProgramLanguageEntity(
            id: 2,
            name: 'New Course',
            description: 'Description of new course',
            imgPath: '',
            courseTime: '2 hours',
            aboutTheCourse: 'This is a new course',
            price: 10,
            lessons: [],
            quizes: [],
          );
          context.read<CourseBloc>().add(AddCourse(newCourse));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
