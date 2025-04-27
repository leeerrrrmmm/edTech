import 'dart:developer';

import 'package:course_ed_tech/data/services/saved_hive_services.dart';
import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saved_bloc_event.dart';
part 'saved_bloc_state.dart';

class SavedBloc extends Bloc<SavedBlocEvent, SavedBlocState> {
  SavedBloc() : super(SavedBlocInitial()) {
    on<LoadSavedCourses>((event, emit) async {
      try {
        List<ProgramLanguageEntity> courses =
            await SavedHiveServices.loadSavedCourses();
        emit(SavedCourseLoaded(savedCourses: courses));
      } catch (e) {
        log('Error loading courses: $e');
      }
    });

    on<AddSavedCourse>((event, emit) async {
      try {
        var existCourse = await SavedHiveServices.loadSavedCourses();

        if (!existCourse.any((el) => el.id == event.savedCourse.id)) {
          await SavedHiveServices.saveCourse(event.savedCourse);
          existCourse.add(event.savedCourse);
          emit(SavedCourseLoaded(savedCourses: existCourse));
        } else {
          log('Course already added');
        }
      } catch (e) {
        log('Error loading courses: $e');
      }
    });

    on<RemoveSavedCourse>((event, emit) async {
      try {
        var existingCourse = await SavedHiveServices.loadSavedCourses();
        bool removed = await SavedHiveServices.removeSavedCourse(
          event.savedCourseForDelete,
        );
        if (removed) {
          existingCourse.removeWhere(
            (c) => c.id == event.savedCourseForDelete.id,
          );
          emit(SavedCourseLoaded(savedCourses: existingCourse));
        } else {
          log('Course not found for deletion');
        }
      } catch (e) {
        log('Deletion error: $e');
      }
    });
  }
}
