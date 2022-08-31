import 'package:dio/dio.dart';
import 'package:enviro_bank_ltd/app/config.dart';
import 'package:enviro_bank_ltd/core/db/database.dart';
import 'package:enviro_bank_ltd/export.dart';

class LoanApi extends ChangeNotifier {
  dynamic _responseMessage = '';
  String _result = '';
  int _totalLoan = 0;
  final Dio _dio = Dio();

  dynamic get responseMessage => _responseMessage;

  String get result => _result;

  int get totalLoan => _totalLoan;

  Future requestLoan({required Map data}) async {
    try {
      _result = '';
      _responseMessage = '';
      //get user token
      String token = await DatabaseProvider().getToken();
      Response response = await _dio.post('$baseUrl/loans',
          data: data,
          options: Options(headers: {
            'content-type': 'application/json',
            'Authorization': token,
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        _result = 'success';
        notifyListeners();
      }
    } on DioError catch (_) {
      _result = 'failed';
      notifyListeners();
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
        _totalLoan = 0;
        _result = 'success';
        notifyListeners();
        if (response.data.isEmpty) {
          _responseMessage = [];
        } else {
          //add all loans together

          for (var loan in response.data) {
            int amount = loan['amount'];
            _totalLoan += amount;
            notifyListeners();
          }
          _responseMessage = response.data;
          notifyListeners();
        }
        return _totalLoan;
      }
    } on DioError catch (_) {
      _result = 'failed';
    }
  }
}
