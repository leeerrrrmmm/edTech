import 'package:course_ed_tech/core/widgets/build_button.dart';
import 'package:course_ed_tech/generated/l10n.dart';
import 'package:course_ed_tech/presentation/screens/ONBOARDING/screens/intro1.dart';
import 'package:course_ed_tech/presentation/screens/ONBOARDING/screens/intro2.dart';
import 'package:course_ed_tech/presentation/screens/ONBOARDING/screens/intro3.dart';
import 'package:course_ed_tech/presentation/screens/SIGNUP/sign_up.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int curPage = 0;
  final PageController _pageController = PageController();
  static const List<Widget> _screens = [Intro1(), Intro2(), Intro3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // TOP SKIP BUTTON
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap:
                      () => _pageController.jumpToPage(
                        2,
                      ), // переход к последней странице
                  child: Text(
                    S.of(context).skip,
                    style: TextStyle(
                      color: Color(0xffe3562a),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            // SCREENS (PageView)
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (newPage) {
                  setState(() {
                    curPage = newPage;
                  });
                },
                children: _screens,
              ),
            ),
            // BOT BUTTON - Next or Finish
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: BuildButton(
                color: const Color(0xffe3562a),
                text: curPage == 2 ? S.of(context).finish : S.of(context).next,
                textColor: Colors.white,
                onTap: () {
                  if (curPage == 2) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) =>
                                const SignUp(), // Переход на следующий экран после завершения
                      ),
                    );
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn,
                    );
                  }
                },
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
