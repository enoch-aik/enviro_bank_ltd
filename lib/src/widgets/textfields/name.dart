import 'package:enviro_bank_ltd/core/validators/validators.dart';
import 'package:enviro_bank_ltd/export.dart';

class NameField extends StatelessWidget {
  final String labelText;
  final bool? enabled;
  final Widget? prefixIcon;
  final int? maxLines;
  final TextEditingController controller;

  const NameField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.enabled,
    this.maxLines,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: TextFormField(
          controller: controller,
          style: GoogleFonts.openSans(
              fontSize: 15.sp, color: CustomColors.secondaryColor),
          enabled: enabled ?? true,

          //textAlignVertical: TextAlignVertical.top,
          keyboardType: TextInputType.name,
          validator: (value) {
            RegExp nameExp = Validators.nameExp;

            if (value!.isEmpty) {
              return 'This field is required';
            } else if (!nameExp.hasMatch(value)) {
              return 'This name is not valid';
            }

            return null;
          },
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(top: 5.h, left: 15.w),
            counter: const SizedBox(height: 0),
            labelText: labelText,
          )),
    );
  }
}
