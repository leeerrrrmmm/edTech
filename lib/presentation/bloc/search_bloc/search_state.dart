part of 'search_bloc.dart';

@immutable
sealed class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class LoadSearchedCourses extends SearchState {
  final List<ProgramLanguageEntity> loadFindedCourses;
  LoadSearchedCourses(this.loadFindedCourses);
  @override
  List<Object?> get props => [loadFindedCourses];
}
