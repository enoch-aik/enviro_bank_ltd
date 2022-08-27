import 'package:enviro_bank_ltd/export.dart';


Widget kTextButton(
    {required onTap,
    required title,
    buttonColor,
    width,
    height,
    fontSize,
    fontWeight,
    textColor,
    context}) {
  return SizedBox(
    height: height ?? 50.h,
    width: width ?? 382.w,
    child: TextButton(
      onPressed: onTap,
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(buttonColor)),
      child: KText(
        title,
        color: textColor ?? CustomColors.white,
        fontSize: fontSize ?? 17.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    ),
  );
}

Widget kOutlinedButton(
    {required onTap,
    required title,
    textColor,
    buttonColor,
    borderColor,
    fontSize,
    fontWeight,
    height,
    width}) {
  return SizedBox(
    height: height ?? 50.h,
    width: width ?? 382.w,
    child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          side: MaterialStateProperty.all(BorderSide(
              width: 0.5, color: borderColor ?? CustomColors.appColor)),
        ),
        onPressed: onTap,
        child: KText(
          title,
          color: textColor ?? CustomColors.appColor,
          fontSize: fontSize ?? 17.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
        )),
  );
}

Widget kElevatedButton({
  required onTap,
  required title,
  textColor,
  fontSize,
  fontWeight,
  buttonColor,
}) {
  return SizedBox(
    height: 50.h,
    width: 382.w,
    child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor)),
        onPressed: onTap,
        child: KText(
          title,
          color: textColor ?? CustomColors.white,
          fontSize: fontSize ?? 17.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
        )),
  );
}
