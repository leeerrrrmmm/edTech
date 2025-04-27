part of 'course_bloc.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class AddedCoursesLoaded extends CourseState {
  final List<ProgramLanguageEntity> addedCourses;

  AddedCoursesLoaded({required this.addedCourses});
}

class CourseLoading extends CourseState {}

class CourseError extends CourseState {
  final String errorMessage;
  CourseError({required this.errorMessage});
}
