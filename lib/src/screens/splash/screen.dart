import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:enviro_bank_ltd/app/models/user.dart';
import 'package:enviro_bank_ltd/core/providers/auth.dart';
import 'package:enviro_bank_ltd/core/providers/db.dart';
import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/widgets/loading_dialog.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkPreviousLogin();
    //Delay for 2 seconds and check previous login
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

  checkPreviousLogin() {
    Timer(const Duration(milliseconds: 2000), () async {
      //if (mounted) return;
      showLoadingDialog(context, cupertino: true);
      final db = ref.read(databaseProvider);
      final auth = ref.read(authProvider);
      String email = await db.getEmail();
      String password = await db.getPassword();
      if (email.isNotEmpty && password.isNotEmpty) {
        //User credentials
        User user = User(emailAddress: email, password: password);
        await auth.login(data: user.toJson()).then((value) {
          if (auth.result == 'success') {
            db.saveToken(token: auth.responseMessage);
            context.go('/home');
          } else {
            context.go('/login');
          }
        });
      } else {
        // ignore: use_build_context_synchronously
        context.go('/login');
      }
    });
  }
}
