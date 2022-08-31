import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/res/theme.dart';
import 'package:enviro_bank_ltd/src/router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(360, 780),
        builder: (context, _) {
          return MaterialApp.router(
            routeInformationProvider: routes.routeInformationProvider,
            routeInformationParser: routes.routeInformationParser,
            routerDelegate: routes.routerDelegate,
            title: 'Enviro',
            debugShowCheckedModeBanner: false,
            theme: customTheme,
          );
        });
  }
}
