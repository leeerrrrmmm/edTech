import 'package:course_ed_tech/core/const/const.dart';
import 'package:course_ed_tech/domain/entities/APP_LANG_ENTITY/app_locale.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'locale_repository.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  @override
  Future<AppLocale> getSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(localeKey) ?? 'en';
    return AppLocale(code);
  }

  @override
  Future<void> saveLocale(AppLocale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(localeKey, locale.languageCode);
  }
}
