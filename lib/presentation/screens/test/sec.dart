import 'package:course_ed_tech/presentation/bloc/course_bloc/course_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddedCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Мои курсы')),
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CourseError) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is AddedCoursesLoaded) {
            return ListView.builder(
              itemCount: state.addedCourses.length,
              itemBuilder: (context, index) {
                final course = state.addedCourses[index];
                return ListTile(
                  title: Text(course.name),
                  subtitle: Text(course.description),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      BlocProvider.of<CourseBloc>(
                        context,
                      ).add(RemoveCourse(course));
                    },
                  ),
                );
              },
            );
          }
          return Center(child: Text('Нет добавленных курсов'));
        },
      ),
    );
  }
}
