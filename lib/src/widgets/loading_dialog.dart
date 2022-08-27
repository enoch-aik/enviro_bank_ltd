import 'package:enviro_bank_ltd/export.dart';
import 'package:flutter/cupertino.dart';

Future showLoadingDialog(context, {bool cupertino = false}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            elevation: 0,
            backgroundColor: CustomColors.transparent,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 40.h,
                    width: 40.h,
                    child: cupertino == true
                        ? CupertinoActivityIndicator(
                            color: CustomColors.white,
                          )
                        : const CircularProgressIndicator()),
              ],
            ),
          ));
}
