import 'package:enviro_bank_ltd/core/providers/loan.dart';
import 'package:enviro_bank_ltd/export.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final loanAmount = ref.watch(futureLoanProvider);
      return ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: Container(
          height: 200.h,
          width: 360.w,
          decoration: BoxDecoration(
              color: CustomColors.appColor,
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  image: AssetImage('assets/images/home_card.png'))),
          child: Padding(
            padding: EdgeInsets.only(top: 15.w, left: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  'Loan amount',
                  fontSize: 16.sp,
                  color: CustomColors.white,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: KText(
                    //Use futureProvider to get total loan
                    loanAmount.when(
                        data: (data) {
                          return 'R $data.00';
                        },
                        error: (e, _) {
                          return 'R 0.00';
                        },
                        loading: () => 'R 0.00'),
                    // 'R 0.00',
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.white,
                  ),
                ),
                KText(
                  'In need of cash?',
                  color: CustomColors.white,
                  fontSize: 15.sp,
                ),
                SizedBox(height: 5.h),
                KText('Request loan in few minutes',
                    color: CustomColors.white.withOpacity(0.6)),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: InkWell(
                    onTap: () {
                      context.push('/loan');
                    },
                    child: Container(
                      width: 130.w,
                      height: 35.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: CustomColors.white,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          KText(
                            'Apply Now',
                            color: CustomColors.appColor,
                          ),
                          SizedBox(width: 7.w),
                          Icon(
                            Icons.send,
                            color: CustomColors.appColor,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
