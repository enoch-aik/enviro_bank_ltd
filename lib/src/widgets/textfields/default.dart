import 'package:enviro_bank_ltd/export.dart';

class KTextField extends ConsumerWidget {
  final String labelText;
  final IconData? prefixIcon;
  final int? maxLines;
  final String? hintText;
  final TextEditingController controller;

  const KTextField(
      {Key? key,
      required this.labelText,
      this.hintText,
      required this.controller,
      this.prefixIcon,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: SizedBox(
        //height: 50.h,
        child: TextFormField(
          controller: controller,
          style: GoogleFonts.poppins(
              fontSize: 14.sp, color: CustomColors.secondaryColor),
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          onChanged: (value) {},
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    width: 0.5, color: CustomColors.appColor.withOpacity(0.1))),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 0.5, color: CustomColors.appColor.withOpacity(0.6)),
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            labelText: labelText,
            hintText: hintText,
            labelStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400),
            /* contentPadding:
                const EdgeInsets.only(left: 20, bottom: 10, top: 0, right: 15),*/
          ),
        ),
      ),
    );
  }
}
