import 'package:enviro_bank_ltd/core/db/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<DatabaseProvider> databaseProvider =
    ChangeNotifierProvider((ref) => DatabaseProvider());
