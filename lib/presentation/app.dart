import 'package:course_ed_tech/presentation/screens/BOTTOM/botton_nav_bar.dart';
import 'package:course_ed_tech/presentation/screens/PROFILE/profile_screens/payment_screens/add_card_to_pay.dart';
// import 'package:course_ed_tech/presentation/screens/SPLASH/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import 'localization/locale_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    if (!localeProvider.isLoaded) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: localeProvider.locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: CustomBottomNavigationBar(),
    );
  }
}
