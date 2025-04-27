import 'package:course_ed_tech/domain/entities/APP_LANG_ENTITY/app_locale.dart';
import 'package:flutter/material.dart';
import '../../domain/usecases/locale/get_saved_locale.dart';
import '../../domain/usecases/locale/set_locale.dart';

class LocaleProvider extends ChangeNotifier {
  final GetSavedLocale getSavedLocale;
  final SetLocale setLocaleUseCase;

  Locale? _locale;
  bool _isLoaded = false;

  Locale? get locale => _locale;
  bool get isLoaded => _isLoaded;

  LocaleProvider({
    required this.getSavedLocale,
    required this.setLocaleUseCase,
  }) {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final saved = await getSavedLocale();
    _locale = saved.toLocale();
    _isLoaded = true;
    notifyListeners();
  }

  Future<void> updateLocale(Locale locale) async {
    _locale = locale;
    await setLocaleUseCase(AppLocale(locale.languageCode));
    notifyListeners();
  }
}
