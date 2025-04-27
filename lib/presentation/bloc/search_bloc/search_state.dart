part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class LoadSearchedCourses extends SearchState {
  final List<ProgramLanguageEntity> loadFindedCourses;
  LoadSearchedCourses(this.loadFindedCourses);
}
