import 'package:course_ed_tech/core/widgets/build_img.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/generated/l10n.dart';
import 'package:flutter/material.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BuildImg(assetPath: 'assets/img/intro2.png'),
            Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: BuildText(
                textAlign: TextAlign.center,
                text: S.of(context).intro_title2,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            BuildText(
              text: S.of(context).description_intro2,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff78746D),
            ),
          ],
        ),
      ),
    );
  }
}
