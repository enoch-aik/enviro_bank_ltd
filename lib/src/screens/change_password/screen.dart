import 'package:enviro_bank_ltd/core/db/database.dart';
import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/widgets/bg_scaffold.dart';
import 'package:enviro_bank_ltd/src/widgets/buttons.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> passwordKey = GlobalKey();
    //get password
    getPassword() async {
      String password = '';
      final db = DatabaseProvider();
      password = await db.getPassword();
      return password;
    }

    // password key

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: getPassword(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: 700.h,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const SizedBox();
                      } else if (snapshot.hasData) {
                        return Column(
                          children: [
                            TextFormField(
                              style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  color: CustomColors.secondaryColor),
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                } else if (value != snapshot.data) {
                                  return 'Your password is incorrect';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 5.h, left: 15.w),
                                labelText: 'Old password',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40.h),
                              child: kElevatedButton(
                                  onTap: () {
                                    if (passwordKey.currentState!.validate()) {
                                      context.replace('/change_password2');
                                    }
                                  },
                                  title: 'Continue'),
                            )
                          ],
                        );
                      }
                    }
                    return const SizedBox();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
