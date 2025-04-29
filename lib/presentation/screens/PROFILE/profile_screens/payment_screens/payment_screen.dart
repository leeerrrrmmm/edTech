import 'package:course_ed_tech/core/widgets/build_button.dart';
import 'package:course_ed_tech/core/widgets/build_img.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/domain/entities/CREDIT_CARD_ENTITY/credit_card_entity.dart';
import 'package:course_ed_tech/generated/l10n.dart';
import 'package:course_ed_tech/presentation/bloc/card_bloc/card_bloc_bloc.dart';
import 'package:course_ed_tech/presentation/screens/PROFILE/profile_screens/payment_screens/add_card_to_pay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_credit_card/u_credit_card.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localString = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: BuildText(
          text: 'Payment',
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<CardBloc, CardBlocState>(
          builder: (context, state) {
            if (state is CardBlocInitial) {
              context.read<CardBloc>().add(LoadUserCreditCards());
            }
            if (state is LoadUserCreditCart &&
                state.userCreditCards.isNotEmpty) {
              // Есть карты — отображаем список
              return ListView.builder(
                itemCount: state.userCreditCards.length,
                itemBuilder: (context, index) {
                  final CreditCardEntity card = state.userCreditCards[index];
                  return Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: CreditCardUi(
                      enableFlipping: true,
                      cardHolderFullName: card.cardHolderName,
                      cardNumber: card.cardNum,
                      validThru: card.validThro,
                      validFrom: card.validFrom,
                      cvvNumber: '***',
                    ),
                  );
                },
              );
            } else {
              // Нет карт — показываем текущий виджет
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BuildImg(assetPath: 'assets/img/no_pay.png'),
                  BuildText(
                    text: localString.no_payment_method,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  BuildText(
                    textAlign: TextAlign.center,
                    text: localString.you_dont_have_any_payment,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: BuildButton(
                      onTap:
                          () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => AddCardToPay(),
                            ),
                          ),
                      text: localString.continues,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      textColor: Colors.white,
                      color: Color(0xffe3562a),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
