import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final List<ProgramLanguageEntity> _courseList;
  SearchBloc(this._courseList) : super(SearchInitial()) {
    on<LoadFindedCourses>((event, emit) {
      emit(LoadSearchedCourses(_courseList));
    });

    on<SearchCourses>((event, emit) {
      final query = event.query.toLowerCase();
      final findedCourse =
          _courseList
              .where(
                (lang) => lang.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
      emit(LoadSearchedCourses(findedCourse));
    });
  }
}
