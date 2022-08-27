import 'package:enviro_bank_ltd/export.dart';

class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KScaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error.toString()),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 50.h,
              width: 150.w,
              child: InkWell(
                onTap: () {
                  context.go('/');
                },
                child: Card(
                  color: CustomColors.appColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Center(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.w),
                        child: KText(
                    'GO HOME',
                    color: CustomColors.mainYellow,
                  ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
