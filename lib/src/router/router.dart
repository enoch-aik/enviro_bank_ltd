import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/screens/home/screen.dart';

final GoRouter routes = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const HomeScreen();
    },
  ),
  GoRoute(
    path: '/b',
    builder: (BuildContext context, GoRouterState state) {
      return HomeScreen();
    },
  ),
]);
