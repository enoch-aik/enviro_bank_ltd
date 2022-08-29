import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    const currencySymbol = 'R';
    if (newValue.text.isEmpty || newValue.text.trim() == currencySymbol) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      var selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final f =
          NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: '');
      var num = int.parse(newValue.text.replaceAll(RegExp('[^0-9]'), ''));
      final newString = '$currencySymbol ${f.format(num).trim()}';
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}

int? convertCurrencyToString({required String? currency}) {
  if (currency!.isNotEmpty) {
    double convertedValue = double.parse(currency
        .substring(1, currency.length)
        .replaceAll(',', '')
        .replaceAll(' ', ''));
    return convertedValue.toInt();
  } else {
    return 10;
  }
}


