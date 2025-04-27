import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';

abstract class LanguageRepository {
  Future<List<ProgramLanguageEntity>> getLanguages();
}
