part of 'course_bloc.dart';

@immutable
abstract class CourseEvent {}

class LoadCourses extends CourseEvent {}

class AddCourse extends CourseEvent {
  final ProgramLanguageEntity boughtRate;

  AddCourse(this.boughtRate);
}

class RemoveCourse extends CourseEvent {
  final ProgramLanguageEntity courseForDelete;

  RemoveCourse(this.courseForDelete);
}
