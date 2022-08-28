import 'package:enviro_bank_ltd/core/validators/validators.dart';
import 'package:enviro_bank_ltd/export.dart';

class EmailField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const EmailField(
      {Key? key, required this.labelText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: TextFormField(
          controller: controller,
          style: GoogleFonts.poppins(
              fontSize: 14.sp, color: CustomColors.secondaryColor),

          //textAlignVertical: TextAlignVertical.top,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            RegExp emailExp = Validators.emailExp;
            if (value!.isEmpty) {
              return 'Email is required';
            }
            if (!emailExp.hasMatch(value)) {
              return 'This is not a valid email address';
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 5.h, left: 15.w),
            counter: const SizedBox(height: 0),
            labelText: labelText,
          )),
    );
  }
}
