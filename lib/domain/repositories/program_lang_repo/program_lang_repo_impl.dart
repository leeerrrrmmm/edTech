import 'package:course_ed_tech/data/data_sourse/data_source_program_lang.dart';
import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';
import 'package:course_ed_tech/domain/repositories/program_lang_repo/program_lang_repo.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageLocalDataSource dataSource;

  LanguageRepositoryImpl({required this.dataSource});

  @override
  Future<List<ProgramLanguageEntity>> getLanguages() {
    return dataSource.getLanguages();
  }
}
