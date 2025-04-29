part of 'card_bloc_bloc.dart';

sealed class CardBlocEvent extends Equatable {
  const CardBlocEvent();

  @override
  List<Object> get props => [];
}

final class LoadUserCreditCards extends CardBlocEvent {
  @override
  List<Object> get props => [];
}

class AddCreditCard extends CardBlocEvent {
  final CreditCardEntity cardEntity;

  const AddCreditCard(this.cardEntity);
  @override
  List<Object> get props => [cardEntity];
}

class RemoveCreditCard extends CardBlocEvent {
  final CreditCardEntity cardEntity;

  const RemoveCreditCard(this.cardEntity);
  @override
  List<Object> get props => [];
}
