part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

abstract class LoginActionState extends LoginState {}

// Build State
class LoginInitial extends LoginState {}

class LoginRequestProcessingState extends LoginState {}

class LoginRequestSucessState extends LoginState {
  final String token;
  LoginRequestSucessState({required this.token}) {
    SecureStorageRepository().saveData('token', this.token);
    print("Save Success");
  }
}

class LoginRequestErrorState extends LoginState {}

class LoginRequestUnsuccessFullState extends LoginState {}

// Action State

class LoginNavigateToRegisterActionState extends LoginActionState {}

class LoginNavigateToForgetPasswordActionState extends LoginActionState {}

class LoginNavigateToTabsActionState extends LoginActionState {}

class EmailChangedActionState extends LoginActionState {}

class PasswordChangeActionState extends LoginActionState {}