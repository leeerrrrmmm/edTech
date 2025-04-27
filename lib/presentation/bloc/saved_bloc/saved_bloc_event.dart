part of 'saved_bloc_bloc.dart';

@immutable
abstract class SavedBlocEvent {}

class LoadSavedCourses extends SavedBlocEvent {}

class AddSavedCourse extends SavedBlocEvent {
  final ProgramLanguageEntity savedCourse;

  AddSavedCourse(this.savedCourse);
}

class RemoveSavedCourse extends SavedBlocEvent {
  final ProgramLanguageEntity savedCourseForDelete;

  RemoveSavedCourse(this.savedCourseForDelete);
}
