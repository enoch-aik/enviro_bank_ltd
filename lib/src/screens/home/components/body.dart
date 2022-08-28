import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/constants/quick_actions.dart';
import 'package:enviro_bank_ltd/src/screens/coming_soon/screen.dart';
import 'package:enviro_bank_ltd/src/screens/home/components/home_card.dart';
import 'package:enviro_bank_ltd/src/screens/home/components/quick_actions.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/custom_drawer.dart';

class HomeBody extends StatelessWidget {
  final ZoomDrawerController? drawerController;

  const HomeBody({Key? key, required this.drawerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KScaffold(
      appBar: AppBar(
        title: KText(
          'Dashboard',
          color: CustomColors.appColor,
          fontSize: 16.sp,
        ),
        leading: InkWell(
          child: Icon(
            Icons.menu,
            color: CustomColors.appColor,
          ),
          onTap: () {
            FancyZoomDrawer.of(context)!.toggle();
          },
        ),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            iconSize: 25.w,
            icon: Icon(
              Icons.notifications,
              color: CustomColors.appColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeCard(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: KText(
                  'Quick Actions',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      mainAxisExtent: 130.h,
                      mainAxisSpacing: 30,
                      crossAxisCount: 2),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return quickActions(context,
                        color: quickOptionColors[index],
                        iconName: icons[index],
                        title: titles[index],
                        description: description[index]);
                  }),
              SizedBox(height: 20.h),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ComingSoonScreen()));
                },
                tileColor: CustomColors.appColor.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                leading: SvgPicture.asset(
                  'assets/svg/buy_now.svg',
                  width: 30.w,
                  color: CustomColors.appColor,
                ),
                title: KText(
                    'Buy now, pay later with our smart banking package',
                    textAlign: TextAlign.left,
                    fontSize: 13.sp),
                trailing: Icon(
                  Icons.arrow_forward_sharp,
                  color: CustomColors.appColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
