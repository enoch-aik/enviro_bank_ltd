import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/screens/coming_soon/screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget quickActions(context,
    {required Color color,
    required String iconName,
    required String title,
    required String description}) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>const ComingSoonScreen()));
    },
    child: Container(
      width: 170.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/svg/$iconName.svg',
            width: 35.w,
            color: color,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: KText(
              title,
              color: CustomColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          KText(
            description,
            color: color,
            fontSize: 12.sp,
          ),
        ],
      ),
    ),
  );
}
