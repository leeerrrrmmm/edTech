import 'package:course_ed_tech/core/widgets/animated_container_button.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/core/widgets/build_text_button.dart';
import 'package:course_ed_tech/generated/l10n.dart';
import 'package:course_ed_tech/presentation/screens/PROFILE/profile_screens/payment_screen.dart';
import 'package:course_ed_tech/presentation/screens/PROFILE/profile_screens/saved_screen.dart';
import 'package:course_ed_tech/presentation/screens/PROFILE/profile_screens/your_courses_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // PROFILE TEXT
              BuildText(
                text: S.of(context).profile,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              // CIRCLE AVATAR
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 4),
                  ),
                  child: ClipOval(
                    child: Image.asset('assets/img/prof_img.png'),
                  ),
                ),
              ),

              // COURSES
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    children: [
                      // YOUR COURSES
                      AnimatedContainerButton(
                        text: S.of(context).your_courses,
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => YourCoursesScreen(),
                            ),
                          );
                        },
                      ),
                      // SAVED
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: AnimatedContainerButton(
                          text: S.of(context).saved,
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SavedScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      // PAYMENT
                      AnimatedContainerButton(
                        text: S.of(context).payment,
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => PaymentScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 14),
                      // LOGOUT
                      BuildTextButton(
                        onTap: () {},
                        text: S.of(context).logout,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
