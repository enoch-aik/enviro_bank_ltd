import 'package:enviro_bank_ltd/app/models/user.dart';
import 'package:enviro_bank_ltd/core/providers/auth.dart';
import 'package:enviro_bank_ltd/core/providers/db.dart';
import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/widgets/alert_dialog.dart';
import 'package:enviro_bank_ltd/src/widgets/bg_scaffold.dart';
import 'package:enviro_bank_ltd/src/widgets/buttons.dart';
import 'package:enviro_bank_ltd/src/widgets/loading_dialog.dart';
import 'package:enviro_bank_ltd/src/widgets/textfields/email.dart';
import 'package:enviro_bank_ltd/src/widgets/textfields/password.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Signup key and textfield controllers
    GlobalKey<FormState> signupKey = GlobalKey();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BScaffold(
      appBar: AppBar(
        title: KText(
          'Create Account',
          fontSize: 18.sp,
          color: CustomColors.white,
        ),
      ),
      body: Form(
        key: signupKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: KText(
                  'Create your Enviro Bank account',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              EmailField(
                  labelText: 'Email address', controller: emailController),
              SizedBox(height: 5.h),
              PasswordField(
                  labelText: 'Password',
                  controller: passwordController,
                  isSignUpScreen: true),
              Padding(
                padding: EdgeInsets.only(top: 80.h),
                child: kElevatedButton(
                    onTap: () async {
                      if (signupKey.currentState!.validate()) {
                        //Authentication provider
                        final auth = ref.read(authProvider);
                        final db = ref.read(databaseProvider);
                        User newUser = User(
                            emailAddress: emailController.text.trim(),
                            password: passwordController.text.trim());
                        showLoadingDialog(context);
                        await auth
                            .signUp(data: newUser.toJson())
                            .timeout(const Duration(seconds: 7), onTimeout: () {
                          Navigator.pop(context);
                          showMessageAlertDialog(context,
                              text: 'Oops! Signup failed, try again');
                        }).then((value) async {
                          if (auth.result == 'success') {
                            db.saveEmail(email: emailController.text);
                            db.savePassword(password: passwordController.text);
                            Navigator.pop(context);
                            context.replace('/home');
                            showMessageAlertDialog(context,
                                text:
                                    'Congratulations!, your account has been created successfully');
                          } else {
                            Navigator.pop(context);
                            showMessageAlertDialog(context,
                                text: 'Failed to create account, try again');
                          }
                        });
                        //Log user in
                      }
                    },
                    title: 'Sign up'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () {
                        context.replace('/login');
                      },
                      child: Text.rich(TextSpan(children: [
                        const TextSpan(text: 'Already have an account?  '),
                        TextSpan(
                            text: 'Login',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: CustomColors.mainYellow,
                                decoration: TextDecoration.underline))
                      ]))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
