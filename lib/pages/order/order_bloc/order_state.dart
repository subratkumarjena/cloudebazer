part of 'order_bloc.dart';

@immutable
sealed class OrderState {}

final class OrderInitialState extends OrderState {}
final class OrderLoadingState extends OrderState {}
final class OrderLoadedState extends OrderState {
  OrderData orderdata;
  OrderLoadedState({required this.orderdata});

}
final class OrderErrorState extends OrderState {
  String Errormsg;
  OrderErrorState({required this.Errormsg});
}
