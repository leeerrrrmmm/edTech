import 'package:course_ed_tech/domain/entities/APP_LANG_ENTITY/app_locale.dart';

import '../../repositories/locale_pero/locale_repository.dart';

class GetSavedLocale {
  final LocaleRepository repository;

  GetSavedLocale(this.repository);

  Future<AppLocale> call() async {
    return await repository.getSavedLocale();
  }
}
