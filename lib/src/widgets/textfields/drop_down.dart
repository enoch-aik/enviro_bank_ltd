import 'package:enviro_bank_ltd/export.dart';

class DropdownField extends StatelessWidget {
  final List<String> items;
  final String label;
  final String? initialValue;
  final String? hint;
  final bool? wasEdited;
  final Icon? prefixIcon;
  final ValueNotifier<String?>? valueListenable;

  const DropdownField(
      {Key? key,
      required this.items,
      required this.label,
      this.wasEdited,
      this.prefixIcon,
      required this.hint,
      this.initialValue,
      this.valueListenable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> value = ValueNotifier<String>('');
    return ValueListenableBuilder(
        valueListenable: valueListenable ?? value,
        builder: (context, boxState, child) {
          return Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: DropdownButtonFormField<String>(
                value: wasEdited == true ? initialValue : null,
                menuMaxHeight: 250.h,
                validator: (value) {
                  if (value == null) {
                    return 'Choose an option';
                  }
                  if (!items.contains(value)) {
                    return 'Invalid state';
                  }
                  return null;
                },
                style: GoogleFonts.poppins(
                    fontSize: 15.sp, color: CustomColors.appColor),
                decoration: InputDecoration(
                  counter: const SizedBox(height: 0),
                  contentPadding: EdgeInsets.only(top: 5.h, left: 15.w),
                  labelText: label,
                  hintText: hint,
                  helperText: '',
                ),
                items: items.map((String category) {
                  return DropdownMenuItem(
                      value: category,
                      child: Text(
                        category,
                        style: GoogleFonts.roboto(
                            fontSize: 15.sp,
                            color: CustomColors.secondaryColor),
                      ));
                }).toList(),
                onChanged: (val) {
                  valueListenable!.value = val!;
                  // valueListenable!.value;
                }),
          );
        });
  }
}
