import 'dart:developer';

import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';
import 'package:hive/hive.dart';

class HiveService {
  static Future<void> saveBoughtCourse(ProgramLanguageEntity course) async {
    var box = await Hive.openBox<ProgramLanguageEntity>('coursesBox');
    await box.add(course);
  }

  static Future<List<ProgramLanguageEntity>> loadBoughtCourses() async {
    var box = await Hive.openBox<ProgramLanguageEntity>('coursesBox');
    return box.values.toList();
  }

  static Future<bool> removeBoughtCourse(ProgramLanguageEntity course) async {
    try {
      var box = await Hive.openBox<ProgramLanguageEntity>('coursesBox');

      // Находим индекс курса по id
      int courseIndex = box.values.toList().indexWhere(
        (c) => c.id == course.id,
      );

      // Если курс найден, удаляем его
      if (courseIndex != -1) {
        await box.deleteAt(courseIndex);
        log('Course ${course.name} deleted successfully');
        return true; // Удаление успешно
      } else {
        log('Course ${course.name} not found');
        return false; // Курс не найден
      }
    } catch (e) {
      log('Error removing course: $e');
      return false; // Ошибка удаления
    }
  }
}
