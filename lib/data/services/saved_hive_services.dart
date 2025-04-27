import 'dart:developer';

import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';
import 'package:hive/hive.dart';

class SavedHiveServices {
  static Future<void> saveCourse(ProgramLanguageEntity course) async {
    var box = await Hive.openBox<ProgramLanguageEntity>('boughtCourse');
    await box.add(course);
  }

  static Future<List<ProgramLanguageEntity>> loadSavedCourses() async {
    var box = await Hive.openBox<ProgramLanguageEntity>('boughtCourse');
    return box.values.toList();
  }

  static Future<bool> removeSavedCourse(ProgramLanguageEntity course) async {
    try {
      var box = await Hive.openBox<ProgramLanguageEntity>('boughtCourse');

      int curIndex = box.values.toList().indexWhere((el) => el.id == course.id);

      if (curIndex != -1) {
        await box.deleteAt(curIndex);
        log('Course ${course.name} deleted successfully');
        return true;
      } else {
        log('Course ${course.name} not found');
        return false;
      }
    } catch (e) {
      log('Error removing course: $e');
      return false;
    }
  }
}
