import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/screens/auth/login/screen.dart';
import 'package:enviro_bank_ltd/src/screens/auth/signup/screen.dart';
import 'package:enviro_bank_ltd/src/screens/error/screen.dart';
import 'package:enviro_bank_ltd/src/screens/home/screen.dart';
import 'package:enviro_bank_ltd/src/screens/onboarding/screen.dart';
import 'package:enviro_bank_ltd/src/screens/splash/screen.dart';

final GoRouter routes = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const SplashScreen();
    },
  ),
  GoRoute(
    path: '/home',
    builder: (BuildContext context, GoRouterState state) {
      return const HomeScreen();
    },
  ),
  GoRoute(
    path: '/onboarding',
    builder: (BuildContext context, GoRouterState state) {
      return const OnboardingScreen();
    },
  ),
  GoRoute(
    path: '/login',
    builder: (BuildContext context, GoRouterState state) {
      return const LoginScreen();
    },
  ),
  GoRoute(
    path: '/signup',
    builder: (BuildContext context, GoRouterState state) {
      return const SignUpScreen();
    },
  ),
], errorBuilder: (context, state) => ErrorScreen(error: state.error));
