part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class LoadFindedCourses extends SearchEvent {}

class SearchCourses extends SearchEvent {
  final String query;
  SearchCourses(this.query);
}
