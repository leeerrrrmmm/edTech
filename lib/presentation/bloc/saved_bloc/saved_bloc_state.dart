part of 'saved_bloc_bloc.dart';

@immutable
sealed class SavedBlocState {}

class SavedBlocInitial extends SavedBlocState {}

class SavedCourseLoaded extends SavedBlocState {
  final List<ProgramLanguageEntity> savedCourses;

  SavedCourseLoaded({required this.savedCourses});
}

class SavedCourseLoading extends SavedBlocState {}

class SavedCourseError extends SavedBlocState {
  final String errorMessage;
  SavedCourseError({required this.errorMessage});
}
