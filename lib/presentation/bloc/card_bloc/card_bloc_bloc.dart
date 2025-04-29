import 'dart:developer';

import 'package:course_ed_tech/data/services/credit_card_hive_service.dart';
import 'package:course_ed_tech/domain/entities/CREDIT_CARD_ENTITY/credit_card_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'card_bloc_event.dart';
part 'card_bloc_state.dart';

class CardBloc extends Bloc<CardBlocEvent, CardBlocState> {
  CardBloc() : super(CardBlocInitial()) {
    on<LoadUserCreditCards>((event, emit) async {
      try {
        List<CreditCardEntity> courses =
            await CreditCardHiveService.loadUserCreditCards();
        emit(LoadUserCreditCart(userCreditCards: courses));
      } catch (e) {
        log('Error loading courses: $e');
      }
    });

    on<AddCreditCard>((event, emit) async {
      try {
        var existCourse = await CreditCardHiveService.loadUserCreditCards();

        if (!existCourse.any((el) => el.id == event.cardEntity.id)) {
          await CreditCardHiveService.addUserCreditCard(event.cardEntity);
          existCourse.add(event.cardEntity);
          log('Successfully added credit card');

          emit(LoadUserCreditCart(userCreditCards: existCourse));
        }
      } catch (e) {
        log('Error adding card: $e');
      }
    });

    on<RemoveCreditCard>((event, emit) async {
      try {
        var existCourse = await CreditCardHiveService.loadUserCreditCards();

        bool removed = await CreditCardHiveService.removeUserCreditCard(
          event.cardEntity,
        );

        if (removed) {
          existCourse.removeWhere((el) => el.id == event.cardEntity.id);
          log('Successfully removed credit card');

          emit(LoadUserCreditCart(userCreditCards: existCourse));
        }
      } catch (e) {
        log('Error removing credit card: $e');
      }
    });
  }
}
