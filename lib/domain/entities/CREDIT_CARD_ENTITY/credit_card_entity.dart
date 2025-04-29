import 'package:hive/hive.dart';

part 'credit_card_entity.g.dart';

@HiveType(typeId: 5)
class CreditCardEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String cardHolderName;
  @HiveField(2)
  final String cardNum;
  @HiveField(3)
  final String validFrom;
  @HiveField(4)
  final String validThro;
  @HiveField(5)
  final String cvv;

  CreditCardEntity({
    required this.id,
    required this.cardHolderName,
    required this.cardNum,
    required this.validFrom,
    required this.validThro,
    required this.cvv,
  });
}
