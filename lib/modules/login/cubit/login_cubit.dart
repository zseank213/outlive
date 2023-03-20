import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Eiger/lib.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final LoginService _LoginService = LoginService();

  void getAuth({required AuthLoginModel data}) async {
    emit(OnLoadingGetAuthLogin());

    // try {
    var res = await _LoginService.getLogin(
      data: AuthLoginModel(
        email: data.email,
        password: data.password,
        phone: data.phone,
      ),
    );
    if (res.statusCode == 200) {
      var _data = Login.fromJson(res.data);
      debugPrint('Get Auth Status : Success');
      emit(OnSuccessGetAuthLogin(data: _data));
      await SecureStorage.setAccessToken(token: "${_data.data?.token}");
    } else {
      var _data = Login.fromJson(res.data);

      debugPrint('Get Auth Status: ${res.toString()}');

      emit(
        OnErrorGetAuthLogin(
          errorCode: res.statusCode,
          errorMessage: _data.meta?.messages,
        ),
      );
      // errorCode: res.statusCode, errorMessage: res.toString()));
    }
  }
}
