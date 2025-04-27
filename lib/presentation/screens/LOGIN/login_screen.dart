import 'package:course_ed_tech/core/widgets/build_button.dart';
import 'package:course_ed_tech/core/widgets/build_img.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/core/widgets/build_text_button.dart';
import 'package:course_ed_tech/generated/l10n.dart';
import 'package:course_ed_tech/presentation/screens/BOTTOM/botton_nav_bar.dart';
import 'package:course_ed_tech/presentation/screens/SIGNUP/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16),
              // IMG
              BuildImg(assetPath: 'assets/img/login.png'),

              const SizedBox(height: 16),
              // LOG IN TEXT
              BuildText(
                text: S.of(context).log_in,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),

              const SizedBox(height: 16),
              // LOGIN WITH SOCIAL TEXT
              BuildText(
                text: S.of(context).log_with_social,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: const Color(0xff78764d),
              ),

              const SizedBox(height: 16),
              // SOCIAL MEDIA BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _socialMediaRegistration(FontAwesomeIcons.facebook),
                  const SizedBox(width: 10),
                  _socialMediaRegistration(FontAwesomeIcons.instagram),
                  const SizedBox(width: 10),
                  _socialMediaRegistration(FontAwesomeIcons.google),
                ],
              ),

              const SizedBox(height: 16),
              Form(
                key: _globalKey,
                child: Column(
                  children: <Widget>[
                    // EMAIL TEXT FIELD
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: S.of(context).email,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    // PASSWORD TEXT FIELD
                    TextField(
                      obscureText: _obscureText,
                      controller: _passController,
                      decoration: InputDecoration(
                        hintText: S.of(context).pass,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              // FORGOT PASS BUTTON
              BuildTextButton(
                text: S.of(context).forgot_pass,
                onTap: () {},
                fontWeight: FontWeight.bold,
                fontSize: 14,
                textColor: const Color(0xff78746d),
              ),

              const SizedBox(height: 16),
              // LOGIN BUTTON
              BuildButton(
                color: const Color(0xffe3562a),
                text: S.of(context).log_in,
                onTap: () {
                  // TODO: логика логина
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => CustomBottomNavigationBar(),
                    ),
                  );
                },
                fontWeight: FontWeight.bold,
                fontSize: 18,
                textColor: Colors.white,
              ),

              const SizedBox(height: 16),
              // NAVIGATOR TO SIGN UP SCREEN
              BuildTextButton(
                text: S.of(context).sign_up,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                fontWeight: FontWeight.bold,
                fontSize: 14,
                textColor: const Color(0xff78746d),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Container _socialMediaRegistration(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff65aaea),
        borderRadius: BorderRadius.circular(14),
      ),
      width: 45,
      height: 45,
      child: Center(child: FaIcon(icon, color: Colors.white)),
    );
  }
}
