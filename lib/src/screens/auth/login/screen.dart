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

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Form key to validate user input
    GlobalKey<FormState> loginKey = GlobalKey();
    //Checkbox
    ValueNotifier<bool> rememberMe = ValueNotifier<bool>(false);
    //Textfield controllers
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BScaffold(
      appBar: AppBar(
        title: KText(
          'Login',
          color: CustomColors.white,
          fontSize: 19.sp,
        ),
      ),
      body: Form(
        key: loginKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KText(
                'Welcome Back!',
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h, bottom: 32.h),
                child: KText(
                  'Kindly input your details to Log-in',
                  fontSize: 12.sp,
                  color: CustomColors.textColorLight2,
                ),
              ),
              EmailField(labelText: 'Email', controller: emailController),
              SizedBox(height: 10.h),
              PasswordField(
                  helperText: '',
                  labelText: 'Password',
                  controller: passwordController,
                  isSignUpScreen: false),
              ValueListenableBuilder(
                  valueListenable: rememberMe,
                  builder: (context, boxState, _) {
                    return SizedBox(
                      height: 30.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: rememberMe.value,
                              onChanged: (value) {
                                rememberMe.value = value!;
                              }),
                          const KText('Remember me')
                        ],
                      ),
                    );
                  }),
              Padding(
                padding: EdgeInsets.only(top: 80.h),
                child: kTextButton(
                    onTap: () async {
                      if (loginKey.currentState!.validate()) {
                        //authentication and database provider
                        final auth = ref.read(authProvider);
                        final db = ref.read(databaseProvider);
                        //user login details ==> convert to map for api
                        User user = User(
                            emailAddress: emailController.text.trim(),
                            password: passwordController.text.trim());
                        showLoadingDialog(context);
                        //try login
                        await auth
                            .login(data: user.toJson())
                            .timeout(const Duration(seconds: 8),
                                // is it takes long to query
                                onTimeout: () {})
                            .then((value) async {
                          //if successful
                          if (auth.result == 'success') {
                            //save user's token to local storage
                            db.saveToken(token: auth.responseMessage);
                            //if user wants to be remembered, saved username and password for future login
                            if (rememberMe.value == true) {
                              db.saveEmail(email: emailController.text);
                              db.savePassword(
                                  password: passwordController.text);
                            }
                            Navigator.pop(context);
                            context.replace('/home');
                          }
                          // if login fails
                          else {
                            Navigator.pop(context);
                            showMessageAlertDialog(context,
                                text: 'Oops! Login failed, try again');
                          }
                        });

                        //Log user in
                      }
                    },
                    title: 'Login'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () {
                        context.replace('/signup');
                      },
                      child: Text.rich(TextSpan(children: [
                        const TextSpan(text: 'New User?  '),
                        TextSpan(
                            text: 'Create Account',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: CustomColors.mainYellow,
                                decoration: TextDecoration.underline))
                      ]))
                      /* const KText(
                        'New User?   Create Account',
                        decoration: TextDecoration.underline,
                      )*/
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
