part of 'card_bloc_bloc.dart';

sealed class CardBlocState extends Equatable {
  const CardBlocState();

  @override
  List<Object> get props => [];
}

final class CardBlocInitial extends CardBlocState {}

final class LoadUserCreditCart extends CardBlocState {
  final List<CreditCardEntity> userCreditCards;

  const LoadUserCreditCart({this.userCreditCards = const []});

  @override
  List<Object> get props => [userCreditCards];
}
