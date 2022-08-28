import 'package:enviro_bank_ltd/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseProvider extends ChangeNotifier {
//initialize shared preferences
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  //setters
  String? _setToken = '';
  String? _firstName = '';
  String? _lastName = '';
  String? _setEmail = '';
  String? _setPassword = '';

  //getters
  String get token => _setToken!;

  String get firstName => _firstName!;

  String get lastName => _lastName!;

  String get email => _setEmail!;

  String get password => _setPassword!;

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

  // Save password
  void savePassword({String? password}) async {
    SharedPreferences instancePref = await _pref;
    if (instancePref.containsKey('password')) {
      instancePref.remove("password");
    }

    instancePref.setString("password", password!);
  }

  //Get user password

  Future<String> getPassword() async {
    SharedPreferences instancePref = await _pref;

    if (instancePref.containsKey("password")) {
      String? password = instancePref.getString("password");
      _setPassword = password;
      notifyListeners();
      return password!;
    } else {
      _setPassword = "";
      notifyListeners();
      return "";
    }
  }

  // Save email
  void saveEmail({String? email}) async {
    SharedPreferences instancePref = await _pref;
    if (instancePref.containsKey('email')) {
      instancePref.remove("email");
    }

    instancePref.setString("email", email!);
  }

  //Get email

  Future<String> getEmail() async {
    SharedPreferences instancePref = await _pref;

    if (instancePref.containsKey("email")) {
      String? email = instancePref.getString("email");
      _setEmail = email;
      notifyListeners();
      return email!;
    } else {
      _setEmail = "";
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

  Future<void> logOut() async {
    SharedPreferences instancePref = await _pref;
    // sign-out and clear all data
    instancePref.clear();
  }
}
