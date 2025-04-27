import 'package:course_ed_tech/domain/entities/APP_LANG_ENTITY/app_locale.dart';

import '../../repositories/locale_pero/locale_repository.dart';

class SetLocale {
  final LocaleRepository repository;

  SetLocale(this.repository);

  Future<void> call(AppLocale locale) async {
    await repository.saveLocale(locale);
  }
}
