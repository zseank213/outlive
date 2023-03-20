part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class OnLoadingGetAuthLogin extends LoginState {}

class OnErrorGetAuthLogin extends LoginState {
  final int? errorCode;
  final List<dynamic>? errorMessage;

  OnErrorGetAuthLogin({
    this.errorCode,
    this.errorMessage,
  });
}

class OnSuccessGetAuthLogin extends LoginState {
  final Login? data;

  OnSuccessGetAuthLogin({this.data});
}
