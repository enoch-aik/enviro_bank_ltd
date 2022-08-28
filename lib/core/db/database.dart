import 'package:enviro_bank_ltd/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseProvider extends ChangeNotifier {
//initialize shared preferences
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  //setters
  String? _setToken = '';
  String? _firstName = '';
  String? _lastName = '';

  //getters
  String get token => _setToken!;

  String get firstName => _firstName!;

  String get lastName => _lastName!;

  //Save user token
  void saveToken({String? token}) async {
    SharedPreferences instancePref = await _pref;
    if (instancePref.containsKey('token')) {
      instancePref.remove("token");
    }
    instancePref.setString("token", token!);
  }
  // Get user token
  Future<String> getToken() async {
    SharedPreferences instancePref = await _pref;

    if (instancePref.containsKey("token")) {
      String? token = instancePref.getString("token");

      _setToken = token;
      notifyListeners();

      return token!;
    } else {
      _setToken = "";
      notifyListeners();
      return "";
    }
  }

//Save first name
  void saveFirstName({String? firstName}) async {
    SharedPreferences instancePref = await _pref;
    if (instancePref.containsKey('firstName')) {
      instancePref.remove("firstName");
    }
    instancePref.setString("firstName", firstName!);
  }

//Save last name
  void saveLastName({String? lastName}) async {
    SharedPreferences instancePref = await _pref;
    if (instancePref.containsKey('lastName')) {
      instancePref.remove("lastName");
    }
    instancePref.setString("lastName", lastName!);
  }
}
