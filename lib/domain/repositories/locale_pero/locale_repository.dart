import 'package:course_ed_tech/domain/entities/APP_LANG_ENTITY/app_locale.dart';

abstract class LocaleRepository {
  Future<void> saveLocale(AppLocale locale);
  Future<AppLocale> getSavedLocale();
}
