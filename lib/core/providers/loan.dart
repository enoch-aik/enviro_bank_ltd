import 'package:enviro_bank_ltd/core/api/loan.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<LoanApi> loanProvider =
    ChangeNotifierProvider((ref) => LoanApi());
