import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';
import 'package:course_ed_tech/domain/repositories/program_lang_repo/program_lang_repo.dart';

class GetLanguagesUseCase {
  final LanguageRepository repository;

  GetLanguagesUseCase(this.repository);

  Future<List<ProgramLanguageEntity>> call() => repository.getLanguages();
}
