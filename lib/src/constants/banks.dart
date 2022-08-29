List<String> banks = [
  'ABSA',
  'CAPITEC',
  'FNB',
  'INVESTEC LIMITED',
  'NEDBANK LIMITED',
  'STANDARD BANK',
  'VBS'
];
//MAKE THE BANK NAME CORRESPOND WITH PAYLOAD
String formatBank({required String bank}) {
  String formattedValue = bank.replaceAll(' ', '_');
  return formattedValue;
}

Map<String, int> bankCode = {
  "ABSA": 632005,
  'CAPITEC': 470010,
  'FNB': 254005,
  'INVESTEC LIMITED': 580105,
  'NEDBANK LIMITED': 198765,
  'STANDARD BANK': 051001,
  'VBS': 588000
};
