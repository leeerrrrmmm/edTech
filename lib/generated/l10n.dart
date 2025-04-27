// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Text Title`
  String get text_title {
    return Intl.message('Text Title', name: 'text_title', desc: '', args: []);
  }

  /// `Goodbye`
  String get goodbye {
    return Intl.message('Goodbye', name: 'goodbye', desc: '', args: []);
  }

  /// `Open Settings`
  String get openSettings {
    return Intl.message(
      'Open Settings',
      name: 'openSettings',
      desc: '',
      args: [],
    );
  }

  /// `Learn anytime\nand anywhere`
  String get intro_title1 {
    return Intl.message(
      'Learn anytime\nand anywhere',
      name: 'intro_title1',
      desc: '',
      args: [],
    );
  }

  /// `Quarantine is the perfect time to spend your\nday learning something new, from anywhere!`
  String get description_intro1 {
    return Intl.message(
      'Quarantine is the perfect time to spend your\nday learning something new, from anywhere!',
      name: 'description_intro1',
      desc: '',
      args: [],
    );
  }

  /// `  Find a course\nfor you`
  String get intro_title2 {
    return Intl.message(
      '  Find a course\nfor you',
      name: 'intro_title2',
      desc: '',
      args: [],
    );
  }

  /// `Quarantine is the perfect time to spend your\nday learning something new, from anywhere!`
  String get description_intro2 {
    return Intl.message(
      'Quarantine is the perfect time to spend your\nday learning something new, from anywhere!',
      name: 'description_intro2',
      desc: '',
      args: [],
    );
  }

  /// `Improve uour skills`
  String get intro_title3 {
    return Intl.message(
      'Improve uour skills',
      name: 'intro_title3',
      desc: '',
      args: [],
    );
  }

  /// `Quarantine is the perfect time to spend your\nday learning something new, from anywhere!`
  String get description_intro3 {
    return Intl.message(
      'Quarantine is the perfect time to spend your\nday learning something new, from anywhere!',
      name: 'description_intro3',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message('Sign up', name: 'sign_up', desc: '', args: []);
  }

  /// `Log in`
  String get log_in {
    return Intl.message('Log in', name: 'log_in', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Password`
  String get pass {
    return Intl.message('Password', name: 'pass', desc: '', args: []);
  }

  /// `Create your account`
  String get create_account {
    return Intl.message(
      'Create your account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Login with social networks`
  String get log_with_social {
    return Intl.message(
      'Login with social networks',
      name: 'log_with_social',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgot_pass {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_pass',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message('Finish', name: 'finish', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Your Courses`
  String get your_courses {
    return Intl.message(
      'Your Courses',
      name: 'your_courses',
      desc: '',
      args: [],
    );
  }

  /// `Saved`
  String get saved {
    return Intl.message('Saved', name: 'saved', desc: '', args: []);
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Log out`
  String get logout {
    return Intl.message('Log out', name: 'logout', desc: '', args: []);
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Account information`
  String get account_information {
    return Intl.message(
      'Account information',
      name: 'account_information',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Course not saved`
  String get course_not_saved {
    return Intl.message(
      'Course not saved',
      name: 'course_not_saved',
      desc: '',
      args: [],
    );
  }

  /// `Try save the course\nagain in a few minutes`
  String get try_save_the_course {
    return Intl.message(
      'Try save the course\nagain in a few minutes',
      name: 'try_save_the_course',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continues {
    return Intl.message('Continue', name: 'continues', desc: '', args: []);
  }

  /// `No payment method`
  String get no_payment_method {
    return Intl.message(
      'No payment method',
      name: 'no_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any\npayment method`
  String get you_dont_have_any_payment {
    return Intl.message(
      'You don\'t have any\npayment method',
      name: 'you_dont_have_any_payment',
      desc: '',
      args: [],
    );
  }

  /// `Still no your courses`
  String get still_no_your_courses {
    return Intl.message(
      'Still no your courses',
      name: 'still_no_your_courses',
      desc: '',
      args: [],
    );
  }

  /// `Click on the button below\nto go to the course selection screen`
  String get click_on_the_btn_for_the_find_a_new_courses {
    return Intl.message(
      'Click on the button below\nto go to the course selection screen',
      name: 'click_on_the_btn_for_the_find_a_new_courses',
      desc: '',
      args: [],
    );
  }

  /// `About the course`
  String get about_the_course {
    return Intl.message(
      'About the course',
      name: 'about_the_course',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message('Duration', name: 'duration', desc: '', args: []);
  }

  /// `Course not found`
  String get course_not_found {
    return Intl.message(
      'Course not found',
      name: 'course_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Try searching the course with\na different keyword`
  String get try_search_with_a_diff_keyword {
    return Intl.message(
      'Try searching the course with\na different keyword',
      name: 'try_search_with_a_diff_keyword',
      desc: '',
      args: [],
    );
  }

  /// `Dart`
  String get dart_name {
    return Intl.message('Dart', name: 'dart_name', desc: '', args: []);
  }

  /// `Language for Flutter`
  String get dart_description {
    return Intl.message(
      'Language for Flutter',
      name: 'dart_description',
      desc: '',
      args: [],
    );
  }

  /// `You will learn about the Dart programming language, understand the basics and OOP, complete a couple of small projects, and after the course, you can move on to the Flutter course.`
  String get dart_about {
    return Intl.message(
      'You will learn about the Dart programming language, understand the basics and OOP, complete a couple of small projects, and after the course, you can move on to the Flutter course.',
      name: 'dart_about',
      desc: '',
      args: [],
    );
  }

  /// `Python`
  String get python_name {
    return Intl.message('Python', name: 'python_name', desc: '', args: []);
  }

  /// `Popular programming language`
  String get python_description {
    return Intl.message(
      'Popular programming language',
      name: 'python_description',
      desc: '',
      args: [],
    );
  }

  /// `The course will include informative video lessons and quizzes on the Python programming language. You will be able to start your journey as a Python developer.`
  String get python_about {
    return Intl.message(
      'The course will include informative video lessons and quizzes on the Python programming language. You will be able to start your journey as a Python developer.',
      name: 'python_about',
      desc: '',
      args: [],
    );
  }

  /// `JavaScript`
  String get js_name {
    return Intl.message('JavaScript', name: 'js_name', desc: '', args: []);
  }

  /// `Language used for back-end web development`
  String get js_description {
    return Intl.message(
      'Language used for back-end web development',
      name: 'js_description',
      desc: '',
      args: [],
    );
  }

  /// `The course will include educational and fun lessons and quizzes. By the end, you will know where to go next. Buying the premium version unlocks advanced content and increases your chances of getting your first offer.`
  String get js_about {
    return Intl.message(
      'The course will include educational and fun lessons and quizzes. By the end, you will know where to go next. Buying the premium version unlocks advanced content and increases your chances of getting your first offer.',
      name: 'js_about',
      desc: '',
      args: [],
    );
  }

  /// `Flutter`
  String get flutter_name {
    return Intl.message('Flutter', name: 'flutter_name', desc: '', args: []);
  }

  /// `Flutter enables developers to create beautiful, fast, and native apps for iOS, Android, Web, and Desktop.`
  String get flutter_description {
    return Intl.message(
      'Flutter enables developers to create beautiful, fast, and native apps for iOS, Android, Web, and Desktop.',
      name: 'flutter_description',
      desc: '',
      args: [],
    );
  }

  /// `A course from Google on Flutter, which interacts with Dart. You'll learn to build apps for mobile, Windows/Mac/Linux/Web, create projects like a TO-DO list, mini-shop, and an app that fetches movies/series via API.`
  String get flutter_about {
    return Intl.message(
      'A course from Google on Flutter, which interacts with Dart. You\'ll learn to build apps for mobile, Windows/Mac/Linux/Web, create projects like a TO-DO list, mini-shop, and an app that fetches movies/series via API.',
      name: 'flutter_about',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
