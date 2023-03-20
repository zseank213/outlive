import 'package:dio/dio.dart';
import 'package:Eiger/lib.dart';

class LoginService {
  final Dio _dio = Dio();

  LoginService() {
    _dio.interceptors.add(Logging());
  }

  Future<Response> getLogin({required AuthLoginModel data}) async {
    _dio.options.baseUrl = baseUrl;

    Map<String, dynamic> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
    };

    try {
      var response = await _dio.post(
        apiLogin,
        data: {
          "email": data.email,
          "password": data.password,
        },
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      return dioCatchError(e);
    }
  }
}
