import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/widgets/bg_scaffold.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BScaffold(
      appBar: AppBar(
        title: const KText('Application Form'),foregroundColor: CustomColors.appColor,
      ),
      body: SingleChildScrollView(child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(children: [],),
      )),
    );
  }
}
