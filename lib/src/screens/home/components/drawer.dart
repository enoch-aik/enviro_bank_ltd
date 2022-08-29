import 'package:enviro_bank_ltd/core/providers/db.dart';
import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/widgets/custom_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FancyDrawer extends ConsumerWidget {
  final ZoomDrawerController drawerController;

  const FancyDrawer({Key? key, required this.drawerController})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: KScaffold(
          backgroundColor: CustomColors.appColor,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 45.h, bottom: 23.h),
                ),
                // drawerHeader,
                drawerItem(
                    onTap: () => FancyZoomDrawer.of(context)!.toggle(),
                    name: 'Home',
                    icon: Icons.home),
                //Apply for loans
                ListTile(
                  title: KText(
                    'Apply for loan',
                    color: CustomColors.white,
                  ),
                  leading: SvgPicture.asset('assets/svg/cash.svg',
                      color: CustomColors.white, width: 25.w),
                  onTap: () {
                    context.push('/loan');
                  },
                ),
                //View Loans
                ListTile(
                  title: KText(
                    'Loan history',
                    color: CustomColors.white,
                  ),
                  leading: SvgPicture.asset('assets/svg/history.svg',
                      color: CustomColors.white, width: 25.w),
                  onTap: () {
                    context.push('/loan_history');
                  },
                ),
                //Change password
                ListTile(
                  title: KText(
                    'Change password',
                    color: CustomColors.white,
                  ),
                  leading: Icon(
                    Icons.lock_open,
                    color: CustomColors.white,
                    size: 30.w,
                  ),
                  onTap: () {
                    context.push('/change_password');
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: Consumer(builder: (context, ref, child) {
                    final db = ref.read(databaseProvider);
                    return Column(
                      children: [
                        Divider(
                          color: CustomColors.white,
                          thickness: 0.2,
                        ),
                        drawerItem(
                            onTap: () async {
                              //log user out of the app
                              await db.logOut().then(
                                  (value) => context.replace('/onboarding'));
                            },
                            name: 'Logout',
                            icon: Icons.logout,
                            size: 30.w),
                      ],
                    );
                  }),
                ),
              ],
            ),
          )),
    );
  }
}

Widget drawerItem({required onTap, required name, required icon, size = 25}) {
  return ListTile(
    title: KText(
      name,
      color: CustomColors.white,
    ),
    leading: Icon(
      icon,
      color: CustomColors.white,
      size: double.parse(size.toString()),
    ),
    onTap: onTap,
    focusColor: Colors.white70,
  );
}
