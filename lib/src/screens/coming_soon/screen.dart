import 'package:enviro_bank_ltd/export.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KScaffold(
      appBar: AppBar(foregroundColor: CustomColors.appColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 90.h, bottom: 48.h, left: 16.w, right: 16.w),
            child: SvgPicture.asset(
              'assets/svg/empty_illustration.svg',
              height: 382.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: KText(
              'Coming soon....',
              fontSize: 16.sp,
              color: CustomColors.appColor,
            ),
          )
        ],
      ),
    );
  }
}
