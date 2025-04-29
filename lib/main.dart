import 'package:course_ed_tech/data/data_sourse/data_source_program_lang.dart';
import 'package:course_ed_tech/domain/entities/CREDIT_CARD_ENTITY/credit_card_entity.dart';
import 'package:course_ed_tech/domain/entities/LESSONS_FIELD_ENTITY/lessons_field.dart';
import 'package:course_ed_tech/domain/entities/LESSON_ENTITY/lessons_entity.dart';
import 'package:course_ed_tech/domain/entities/PROGRAM_LANG_ENTITY/program_language_entity.dart';
import 'package:course_ed_tech/domain/entities/QUESTION_ENTITY/question_entity.dart';
import 'package:course_ed_tech/domain/entities/QUIZ_ENTITY/quiz_entity.dart';
import 'package:course_ed_tech/domain/repositories/locale_pero/locale_repository_impl.dart';
import 'package:course_ed_tech/firebase_options.dart';
import 'package:course_ed_tech/presentation/bloc/card_bloc/card_bloc_bloc.dart';
import 'package:course_ed_tech/presentation/bloc/course_bloc/course_bloc.dart';
import 'package:course_ed_tech/presentation/bloc/saved_bloc/saved_bloc_bloc.dart';
import 'package:course_ed_tech/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'domain/usecases/locale/get_saved_locale.dart';
import 'domain/usecases/locale/set_locale.dart';
import 'presentation/app.dart';
import 'presentation/localization/locale_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();

  // Регистрируем адаптеры Hive
  Hive.registerAdapter(ProgramLanguageEntityAdapter());
  Hive.registerAdapter(LessonsEntityAdapter());
  Hive.registerAdapter(LessonsFieldAdapter());
  Hive.registerAdapter(QuizEntityAdapter());
  Hive.registerAdapter(QuestionAdapter());
  Hive.registerAdapter(CreditCardEntityAdapter());

  final repository = LocaleRepositoryImpl();
  final getSaved = GetSavedLocale(repository);
  final setLocale = SetLocale(repository);
  final List<ProgramLanguageEntity> programLanguages =
      await LanguageLocalDataSource().getLanguages();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (_) => LocaleProvider(
                getSavedLocale: getSaved,
                setLocaleUseCase: setLocale,
              ),
        ),
        BlocProvider(create: (_) => CourseBloc()),
        BlocProvider(create: (_) => SavedBloc()),
        BlocProvider(create: (_) => SearchBloc(programLanguages)),
        BlocProvider(create: (_) => CardBloc()),
      ],
      child: const App(),
    ),
  );
}
