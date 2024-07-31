part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutEvent {}

class PlaceOrderEvent extends CheckoutEvent{}
