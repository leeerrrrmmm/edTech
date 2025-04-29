import 'dart:developer';

import 'package:course_ed_tech/domain/entities/CREDIT_CARD_ENTITY/credit_card_entity.dart';
import 'package:hive/hive.dart';

class CreditCardHiveService {
  static Future<void> addUserCreditCard(CreditCardEntity creditCard) async {
    var box = await Hive.openBox<CreditCardEntity>('creditCardBox');
    await box.add(creditCard);
  }

  static Future<List<CreditCardEntity>> loadUserCreditCards() async {
    var box = await Hive.openBox<CreditCardEntity>('creditCardBox');
    return box.values.toList();
  }

  static Future<bool> removeUserCreditCard(CreditCardEntity creditCard) async {
    try {
      var box = await Hive.openBox<CreditCardEntity>('creditCardBox');

      int curIndex = box.values.toList().indexWhere(
        (c) => c.id == creditCard.id,
      );

      if (curIndex != -1) {
        await box.deleteAt(curIndex);
        log(
          'Credit card: ${creditCard.cardHolderName} was successfully deleted',
        );
        return true;
      } else {
        log('Credit card: ${creditCard.cardHolderName} not found to delete');
        return false;
      }
    } catch (e) {
      log('Erorr deleting card: $e');
      return false;
    }
  }
}
