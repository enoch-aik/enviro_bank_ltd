import 'package:enviro_bank_ltd/core/validators/validators.dart';
import 'package:enviro_bank_ltd/export.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordField extends StatefulWidget {
  final bool isSignUpScreen;
  final String labelText;
  final String? helperText;
  final TextEditingController controller;

  const PasswordField(
      {Key? key,
      this.helperText,
      required this.labelText,
      required this.controller,
      required this.isSignUpScreen})
      : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscure = true;

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0.h),
          child: TextFormField(
              style: GoogleFonts.poppins(
                  fontSize: 14.sp, color: CustomColors.secondaryColor),
              keyboardType: TextInputType.visiblePassword,
              controller: widget.controller,
              obscureText: obscure,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 8) {
                  return 'Password is less than 8 characters ';
                } else if (!Validators.passwordExp.hasMatch(value)) {
                  return '8 characters with at 1 symbol, digit & uppercase letter';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 5.h, left: 15.w),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    icon: SvgPicture.asset(
                      'assets/svg/show_password.svg',
                      width: 18.w,
                    )),
                helperText: widget.helperText ??
                    '8 characters with at 1 symbol, digit & uppercase letter',
                labelText: widget.labelText,
              )),
        ),
        widget.isSignUpScreen
            ? Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: obscure,
                    style: GoogleFonts.poppins(
                        fontSize: 14.sp, color: CustomColors.secondaryColor),
                    validator: (value) {
                      if (!value!.contains(widget.controller.text)) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5.h, left: 15.w),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: SvgPicture.asset('assets/svg/show_password.svg',
                              width: 18.w)),
                      helperText: '',
                      labelText: 'Confirm Password',
                    )),
              )
            : const SizedBox()
      ],
    );
  }
}
