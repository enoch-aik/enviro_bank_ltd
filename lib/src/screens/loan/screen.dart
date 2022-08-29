import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/widgets/bg_scaffold.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BScaffold(
      appBar: AppBar(
        title: KText('Application Form',
            color: CustomColors.white, fontSize: 18.sp),
        foregroundColor: CustomColors.white,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [],
        ),
      )),
    );
  }
}
