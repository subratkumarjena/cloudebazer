part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitialState extends CheckoutState {}
final class CheckoutLoadingState extends CheckoutState {}
final class CheckoutSuccessState extends CheckoutState {}
final class CheckoutFailureState extends CheckoutState {
  String errorMsg;
  CheckoutFailureState({required this.errorMsg});
}
