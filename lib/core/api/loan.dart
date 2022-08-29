import 'package:dio/dio.dart';
import 'package:enviro_bank_ltd/app/config.dart';
import 'package:enviro_bank_ltd/core/db/database.dart';
import 'package:enviro_bank_ltd/export.dart';

class LoanApi extends ChangeNotifier {
  dynamic _responseMessage = '';
  String _result = '';
  final Dio _dio = Dio();

  dynamic get responseMessage => _responseMessage;

  String get result => _result;

  Future requestLoan({required Map data}) async {
    try {
      _result = '';
      _responseMessage = '';
      //get user token
      String token = await DatabaseProvider().getToken();
      print(token);
      Response response = await _dio.post('$baseUrl/loans',
          data: data,
          options: Options(headers: {
            'content-type': 'application/json',
            'Authorization': token,
          }));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        _result = 'success';
      }
    } on DioError catch (_) {
      print(_);
      _result = 'failed';
    }
  }

  Future getAllLoans() async {
    try {
      _result = '';
      _responseMessage = '';
      //get user token
      String token = await DatabaseProvider().getToken();
      Response response = await _dio.get('$baseUrl/loans',
          options: Options(headers: {
            'content-type': 'application/json',
            'Authorization': token,
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        _result = 'success';
        if (response.data.isEmpty) {
          _responseMessage = [];
        } else {
          _responseMessage = response.data;
        }
      }
    } on DioError catch (_) {
      print(_);
      _result = 'failed';
    }
  }
}
