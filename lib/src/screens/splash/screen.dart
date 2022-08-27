import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:enviro_bank_ltd/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //Delay for 2 seconds and check previous login
    Timer(const Duration(milliseconds: 2000), () async {
      context.replace('/onboarding');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KScaffold(
      body: Center(
        child: Bounce(
          infinite: true,
          child: Text(
            'LOGO',
            style: TextStyle(
                color: CustomColors.appColor,
                fontWeight: FontWeight.w600,
                fontSize: 50.sp),
          ),
        ),
      ),
    );
  }
}
