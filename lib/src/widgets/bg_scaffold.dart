import 'package:enviro_bank_ltd/core/helpers/keyboard.dart';
import 'package:enviro_bank_ltd/export.dart';

class BScaffold extends ConsumerWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final List<Widget>? persistentFooterButtons;
  final Widget? drawer;
  final void Function(bool)? onDrawerChanged;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;

  const BScaffold(
      {Key? key,
      this.appBar,
      this.floatingActionButton,
      this.body,
      this.backgroundColor,
      this.bottomNavigationBar,
      this.onDrawerChanged,
      this.persistentFooterButtons,
      this.drawer,
      this.resizeToAvoidBottomInset,
      this.endDrawer,
      this.bottomSheet})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        KeyboardUtil.hideKeyboard(context);
      },
      child: SafeArea(
        left: false,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  image: AssetImage('assets/images/background.png'))),
          child: Scaffold(
              appBar: appBar,
              floatingActionButton: floatingActionButton,
              bottomNavigationBar: bottomNavigationBar,
              bottomSheet: bottomSheet,
              drawer: drawer,
              persistentFooterButtons: persistentFooterButtons,
              endDrawer: endDrawer,
              backgroundColor: backgroundColor ?? CustomColors.transparent,
              onDrawerChanged: onDrawerChanged,
              body: Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: Container(
                  height: 780.h,
                  width: 360.w,
                  decoration: BoxDecoration(
                      color: CustomColors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.r),
                          topLeft: Radius.circular(50.r))),
                  child: Padding(
                    padding:  EdgeInsets.only(top: 10.h),
                    child: SingleChildScrollView(
                      child: body,
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
