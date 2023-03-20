import 'package:intl/intl.dart';

String formatCurrencyUSD(double price, {bool? isNumber = false}) {
  final stringPrice = price.toString();
  final List splitPrice = stringPrice.split('.');

  var formatCurrency = NumberFormat.currency(
    locale: 'EN',
    name: isNumber ?? false ? '' : 'USD ',
    decimalDigits: 2,
  );

  if (splitPrice.length > 1) {
    final decimal = int.parse(splitPrice[1].toString());
    // Exist
    if (splitPrice[1] != null && decimal > 0) {
      formatCurrency = NumberFormat.currency(
        locale: 'EN',
        name: isNumber ?? false ? '' : 'USD ',
        decimalDigits: 2,
      );
    }
  }

  return formatCurrency.format(price);
}
