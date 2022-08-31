import 'package:enviro_bank_ltd/app/models/user.dart';
import 'package:enviro_bank_ltd/core/db/database.dart';
import 'package:enviro_bank_ltd/core/providers/auth.dart';
import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/widgets/alert_dialog.dart';
import 'package:enviro_bank_ltd/src/widgets/bg_scaffold.dart';
import 'package:enviro_bank_ltd/src/widgets/buttons.dart';
import 'package:enviro_bank_ltd/src/widgets/loading_dialog.dart';
import 'package:enviro_bank_ltd/src/widgets/textfields/password.dart';

class FinalPasswordChangeScreen extends ConsumerWidget {
  const FinalPasswordChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //password controller
    TextEditingController password = TextEditingController();
    //password key
    GlobalKey<FormState> passwordKey = GlobalKey();
    // auth provider
    final auth = ref.read(authProvider);
    return BScaffold(
      appBar: AppBar(
        title: KText(
          'Change Password',
          color: CustomColors.white,
          fontSize: 18.sp,
        ),
        foregroundColor: CustomColors.white,
      ),
      body: Form(
        key: passwordKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
          child: Column(
            children: [
              PasswordField(
                  labelText: 'New Password',
                  controller: password,
                  isSignUpScreen: true),
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: kElevatedButton(
                    onTap: () async {
                      if (passwordKey.currentState!.validate()) {
                        //get email from local storage
                        showLoadingDialog(context);
                        String email = await DatabaseProvider().getEmail();
                        User user =
                            User(emailAddress: email, password: password.text);
                        await auth
                            .changePassword(data: user.toJson())
                            .then((value) {
                          if (auth.result == 'success') {
                            Navigator.pop(context);
                            showMessageAlertDialog(context,
                                text:
                                    'Password change successfully, Login to continue',
                                isDismissible: false, onTap: () {
                              Navigator.pop(context);
                              context.go('/login');
                            });
                          } else {
                            Navigator.pop(context);
                            showMessageAlertDialog(context,
                                text:
                                    'Failed to change password, try again...');
                          }
                        });
                      }
                    },
                    title: 'Change password'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
