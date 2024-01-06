part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginRequestedEvent extends LoginEvent {
  final LoginRequest loginRequest;

  LoginRequestedEvent({required LoginRequest this.loginRequest});
}

class LoginNavigateToRegisterEvent extends LoginEvent {}

class LoginNavigateToTabsEvent extends LoginEvent {}

class LoginNavigateToForgetPasswordEvent extends LoginEvent {}

class EmailUpdatedEvent extends LoginEvent {}

class PasswordUpdateEvent extends LoginEvent {}