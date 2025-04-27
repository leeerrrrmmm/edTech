import 'package:course_ed_tech/core/widgets/build_img.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/generated/l10n.dart';
import 'package:flutter/material.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BuildImg(assetPath: 'assets/img/intro1.png'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: BuildText(
                text: S.of(context).intro_title1,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: BuildText(
                text: S.of(context).description_intro1,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xff78746D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
