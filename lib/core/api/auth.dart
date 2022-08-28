import 'package:dio/dio.dart';
import 'package:enviro_bank_ltd/app/config.dart';
import 'package:enviro_bank_ltd/export.dart';

class AuthenticationProvider extends ChangeNotifier {
  dynamic _responseMessage = '';
  String _result = '';
  final Options _defaultOption =
      Options(headers: {'content-type': 'application/json'});

  dynamic get responseMessage => _responseMessage;

  String get result => _result;
  final Dio _dio = Dio();

  Future signUp({required Map data}) async {
    try {
      Response response = await _dio.post('$baseUrl/users',
          data: data, options: _defaultOption);
      print(response.data);
      if (response.statusCode == 200) {
        _result = 'success';
      }
    } on DioError catch (_) {
      print(_);
    }
  }

  Future login({required Map data}) async {
    Response response = await _dio.post('$baseUrl/users/login',
        data: data, options: _defaultOption);
    if (response.statusCode == 200) {
      print(response.data);
    }
  }
}
