import 'package:course_ed_tech/core/widgets/build_button.dart';
import 'package:course_ed_tech/core/widgets/build_img.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/core/widgets/build_text_button.dart';
import 'package:course_ed_tech/domain/auth/auth_service.dart';
import 'package:course_ed_tech/generated/l10n.dart';
import 'package:course_ed_tech/presentation/screens/BOTTOM/botton_nav_bar.dart';
import 'package:course_ed_tech/presentation/screens/LOGIN/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _obscureText = true;

  Future<void> registerWithGoogle() async {
    try {
      AuthService authService = AuthService();

      await authService.registerGoogle();

      // Проверяем текущего пользователя после успешной регистрации
      final user = authService.getCurUser();

      if (!mounted) return;

      // Если пользователь найден, переходим на главный экран
      if (user != null) {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => CustomBottomNavigationBar()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Align(
              alignment: Alignment.center,
              child: Text('Ошибка авторизации с помощью Google'),
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Align(
            alignment: Alignment.center,
            child: Text('Ошибка авторизации с помощью Google: $e'),
          ),
        ),
      );
      throw Exception('Register error: $e');
    }
  }

  Future<void> registerWithCredential(
    String name,
    String email,
    String pass,
  ) async {
    try {
      final AuthService authService = AuthService();

      await authService.registerWithEmailAndPassword(email, name, pass);

      final user = authService.getCurUser();

      if (!mounted) return;

      if (user != null) {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => CustomBottomNavigationBar()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Align(
              alignment: Alignment.center,
              child: Text("Error with register.Please try again or later."),
            ),
          ),
        );
      }
    } catch (e) {
      throw Exception('Error with register: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BuildImg(assetPath: 'assets/img/signUp.png'),
                Column(
                  children: [
                    // SIGN UP TEXT
                    BuildText(
                      text: S.of(context).sign_up,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    // CREATE ACC TEXT
                    BuildText(
                      text: S.of(context).create_account,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff78764d),
                    ),
                  ],
                ),
                // FORM TEXT FIELD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
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
                        // LOGIN TEXT FIELD
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: S.of(context).name,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
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
                              onPressed:
                                  () => setState(() {
                                    _obscureText = !_obscureText;
                                  }),
                            ),
                          ),
                        ),
                        // SIGN UP BUTTON
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: BuildButton(
                            color: Color(0xffe3562a),
                            text: S.of(context).sign_up,
                            onTap:
                                () => registerWithCredential(
                                  _nameController.text,
                                  _emailController.text,
                                  _passController.text,
                                ),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            textColor: Colors.white,
                          ),
                        ),
                        // NAVIGATE TO LOGIN SCREEN
                        BuildTextButton(
                          text: S.of(context).log_in,
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          textColor: Color(0xff78746d),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
