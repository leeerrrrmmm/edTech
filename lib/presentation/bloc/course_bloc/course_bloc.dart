import 'dart:developer';

import 'package:course_ed_tech/data/services/hive_services.dart';
import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    // Загружаем курсы при инициализации блока
    on<LoadCourses>((event, emit) async {
      try {
        // Загружаем курсы из Hive
        List<ProgramLanguageEntity> courses =
            await HiveService.loadBoughtCourses();
        emit(AddedCoursesLoaded(addedCourses: courses));
      } catch (e) {
        log('Error loading courses: $e');
        emit(CourseError(errorMessage: 'Error loading courses'));
      }
    });

    // Добавляем курс
    on<AddCourse>((event, emit) async {
      try {
        // Проверяем, есть ли курс в списке
        var existingCourse = await HiveService.loadBoughtCourses();
        if (!existingCourse.any((course) => course.id == event.boughtRate.id)) {
          // Добавляем курс, если его нет
          await HiveService.saveBoughtCourse(event.boughtRate);
          existingCourse.add(event.boughtRate);
          emit(AddedCoursesLoaded(addedCourses: existingCourse));
        } else {
          log('Course already added');
        }
      } catch (e) {
        log('Error adding course: $e');
      }
    });

    // Удаляем курс
    on<RemoveCourse>((event, emit) async {
      try {
        var existingCourse = await HiveService.loadBoughtCourses();
        bool removed = await HiveService.removeBoughtCourse(
          event.courseForDelete,
        );
        if (removed) {
          existingCourse.removeWhere(
            (course) => course.id == event.courseForDelete.id,
          );
          emit(AddedCoursesLoaded(addedCourses: existingCourse));
        } else {
          log('Course not found for deletion');
        }
      } catch (e) {
        log('Error removing course: $e');
      }
    });
  }
}
