import 'package:enviro_bank_ltd/core/helpers/currency_formatter.dart';
import 'package:enviro_bank_ltd/src/constants/banks.dart';

class Loan {
  final String firstName;
  final String lastName;
  final String idNumber;
  final String collectionDate;
  final String amount;
  final String accountNumber;
  final String bankName;

  const Loan(
      {required this.firstName,
      required this.lastName,
      required this.idNumber,
      required this.collectionDate,
      required this.amount,
      required this.accountNumber,
      required this.bankName});

  Map<String, dynamic> toJson() => {
        'amount': convertCurrencyToString(currency: amount).toString(),
        'bankAccount': {
          'accountNumber': accountNumber,
          'bankName': formatBank(bank: bankName),
          'branchCode': bankCode[bankName].toString()
        },
        'collectionDate': collectionDate,
        'firstName': firstName,
        'idNumber': idNumber,
        'lastName': lastName
      };
}

//[ayload sample
/*{
  "amount": 0,
  "bankAccount": {
    "accountNumber": 1234567890,
    "bankName": "ABSA",
    "branchCode": 250060
  },
  "collectionDate": "2022-09-25",
  "firstName": "Thembinkosi",
  "idNumber": 9901025391084,
  "lastName": "Lorch"
}*/
