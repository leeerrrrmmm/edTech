import 'package:course_ed_tech/core/widgets/build_button.dart';
import 'package:course_ed_tech/core/widgets/build_img.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/generated/l10n.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localString = S.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TODO если нет карт для оплаты =  отображать одно -> если есть = отобразим карты для оплаты
            // IMG IF COURSE NOT SAVED
            BuildImg(assetPath: 'assets/img/no_pay.png'),
            // NOT SAVED TEXT
            BuildText(
              text: localString.no_payment_method,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            // TRY SAVE COURSE TEXT
            BuildText(
              textAlign: TextAlign.center,
              text: localString.you_dont_have_any_payment,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 40),
            // CONTINUE BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BuildButton(
                onTap: () {
                  //TODO ЛОГИКА ПЕРЕХОДА НА ЕКРАН С ДОБАВЛЕНИЕМ ОПЛАТЫ
                },
                text: localString.continues,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                color: Color(0xffe3562a),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
