import 'package:enviro_bank_ltd/app/models/loan.dart';
import 'package:enviro_bank_ltd/core/providers/loan.dart';
import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/constants/banks.dart';
import 'package:enviro_bank_ltd/src/widgets/alert_dialog.dart';
import 'package:enviro_bank_ltd/src/widgets/bg_scaffold.dart';
import 'package:enviro_bank_ltd/src/widgets/buttons.dart';
import 'package:enviro_bank_ltd/src/widgets/loading_dialog.dart';
import 'package:enviro_bank_ltd/src/widgets/textfields/account_number.dart';
import 'package:enviro_bank_ltd/src/widgets/textfields/date.dart';
import 'package:enviro_bank_ltd/src/widgets/textfields/drop_down.dart';
import 'package:enviro_bank_ltd/src/widgets/textfields/id_number.dart';
import 'package:enviro_bank_ltd/src/widgets/textfields/loan.dart';
import 'package:enviro_bank_ltd/src/widgets/textfields/name.dart';

class LoanScreen extends ConsumerWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Text controllers and ValueNotifiers
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController accountNumber = TextEditingController();
    TextEditingController idNumber = TextEditingController();
    ValueNotifier<String> bank = ValueNotifier<String>('');
    TextEditingController collectionDate = TextEditingController();
    TextEditingController loanAmount = TextEditingController();

    //Loan formKey
    GlobalKey<FormState> loanKey = GlobalKey();

    return BScaffold(
      appBar: AppBar(
        title:
            KText('Loan Request', color: CustomColors.white, fontSize: 18.sp),
        foregroundColor: CustomColors.white,
      ),
      body: Form(
        key: loanKey,
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.h, bottom: 32.h),
                child: KText(
                  'Input your details to process your loan',
                  fontSize: 15.sp,
                  color: CustomColors.appColor,
                ),
              ),
              NameField(controller: firstName, labelText: 'First Name'),
              SizedBox(height: 5.h),
              NameField(controller: lastName, labelText: 'Last Name'),
              SizedBox(height: 5.h),
              IdNumberField(controller: idNumber, labelText: 'ID Number'),
              SizedBox(
                height: 5.h,
              ),
              AccountNumber(
                  controller: accountNumber, labelText: 'Account Number'),
              SizedBox(height: 5.h),
              DropdownField(
                items: banks,
                label: 'Bank',
                hint: 'Choose bank',
                valueListenable: bank,
              ),
              KDateFormField(
                  date: collectionDate, labelText: 'Collection date'),
              KCurrencyField(
                labelText: 'Loan amount',
                controller: loanAmount,
                precedingValue: ValueNotifier<String>(''),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: kElevatedButton(
                    onTap: () async {
                      //validate form
                      if (loanKey.currentState!.validate()) {
                        if (bank.value == 'VBS') {
                          showMessageAlertDialog(context,
                              text:
                                  'Error!, you chose VBS,\nrefer to compliance');
                        } else {
                          final loanP = ref.read(loanProvider);

                          Loan loan = Loan(
                            firstName: firstName.text,
                            lastName: lastName.text,
                            idNumber: idNumber.text,
                            collectionDate: collectionDate.text,
                            amount: loanAmount.text,
                            accountNumber: accountNumber.text,
                            bankName: bank.value,
                          );
                          print(loan.toJson());
                          showLoadingDialog(context);
                          await loanP
                              .requestLoan(data: loan.toJson())
                              .then((value) {
                            if (loanP.result == 'success') {
                              Navigator.pop(context);
                              showMessageAlertDialog(context,
                                  text:
                                      'Congratulations ${firstName.text} ${lastName.text}! Your loan for ${loanAmount.text} has been approved',
                                  onTap: () {
                                Navigator.pop(context);Navigator.popUntil(context, (route) => route.isFirst);
                              });
                            } else {
                              Navigator.pop(context);
                              showMessageAlertDialog(context,
                                  text:
                                      'Failed to process loan request, try again');
                            }
                          });
                        }
                      }
                    },
                    title: 'Request Loan'),
              )
            ],
          ),
        )),
      ),
    );
  }
}
