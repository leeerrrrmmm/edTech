part of 'search_bloc.dart';

@immutable
sealed class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadFindedCourses extends SearchEvent {
  @override
  List<Object?> get props => [];
}

class SearchCourses extends SearchEvent {
  final String query;
  SearchCourses(this.query);
  @override
  List<Object?> get props => [query];
}
