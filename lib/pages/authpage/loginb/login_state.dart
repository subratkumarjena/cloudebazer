part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}
final class LoginLodingState extends LoginState {}
final class LoginLodadeState extends LoginState {}

final class LoginErrorState extends LoginState {
       String errorMsg;
       LoginErrorState({required this.errorMsg});
}
