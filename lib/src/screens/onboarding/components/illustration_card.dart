import 'package:enviro_bank_ltd/export.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget illustrationCard(
    {required String svgPath,
      required String title,
      required String description}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset(
        svgPath,
        height: 200.h,
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: KText(title,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,color: CustomColors.textColorDefault,
            fontSize: 19.sp),
      ),
      KText(
        description,fontSize: 14.sp,
        textAlign: TextAlign.center,color: CustomColors.textColorLighterShade,
      )
    ],
  );
}


