import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/widgets/buttons.dart';

Future showMessageAlertDialog(context, {required text, onTap, isDismissible}) {
  return showDialog(
      barrierDismissible: isDismissible ?? true,
      context: context,
      builder: (context) => AlertDialog(
            elevation: 0,
            actionsAlignment: MainAxisAlignment.center,
            content: KText(text, textAlign: TextAlign.center, fontSize: 15.sp),
            actions: [
              SizedBox(
                height: 40.h,
                width: 150.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: kTextButton(
                      onTap: onTap ??
                          () {
                            Navigator.of(context).pop();
                          },
                      title: 'OK'),
                ),
              )
            ],
          ));
}
