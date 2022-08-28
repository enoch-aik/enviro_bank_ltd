import 'package:enviro_bank_ltd/core/api/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ChangeNotifierProvider<AuthenticationProvider> authProvider =
    ChangeNotifierProvider((ref) => AuthenticationProvider());
