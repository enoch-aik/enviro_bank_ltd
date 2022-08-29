import 'package:enviro_bank_ltd/core/helpers/currency_formatter.dart';
import 'package:enviro_bank_ltd/export.dart';
import 'package:flutter/services.dart';

class KCurrencyField extends StatefulWidget {
  final ValueNotifier<String>? precedingValue;
  final String labelText;

  final TextEditingController controller;

  const KCurrencyField({
    Key? key,
    this.precedingValue,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  @override
  State<KCurrencyField> createState() => _KCurrencyFieldState();
}

class _KCurrencyFieldState extends State<KCurrencyField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /*@override
  void dispose() {
    // TODO: implement dispose
    widget.controller.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.precedingValue!,
        builder: (context, boxState, _) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: TextFormField(
                style: GoogleFonts.poppins(
                    fontSize: 14.sp, color: CustomColors.appColor),
                inputFormatters: <TextInputFormatter>[CurrencyFormatter()],
                controller: widget.controller,
                onChanged: (value) {},
                //textAlignVertical: TextAlignVertical.top,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'This field is required';
                  }
                  if (widget.precedingValue != null) {
                    if (widget.precedingValue!.value == 'Yes' &&
                        value.isEmpty) {
                      return 'This field is required';
                    }
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5.h, left: 15.w),
                  counter: const SizedBox(height: 0),
                  labelText: widget.labelText,
                )),
          );
        });
  }
}
