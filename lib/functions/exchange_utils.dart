import 'package:flutter_app_currency_converter/models/currenciesmodel.dart';
import 'package:flutter_app_currency_converter/models/ratesmodel.dart';
import 'package:flutter_app_currency_converter/utils/key.dart';
import 'package:http/http.dart' as http;

Future<RatesModel> fetchRates() async {
  var response =
      await http.get(Uri.parse('https://openexchangerates.org/api/latest.json?app_id=' + key));
  final allRates = ratesModelFromJson(response.body);
  return allRates;
}

Future<Map> fetchCurrencies() async {
  var response =
      await http.get(Uri.parse('https://openexchangerates.org/api/currencies.json?app_id=' + key));
  final allCurrencies = allCurrenciesFromJson(response.body);
  return allCurrencies;
}

String convert(Map exchangeRates, String amount, String currencyBase, String currencyTarget) {
  String result =
      (double.parse(amount) / exchangeRates[currencyBase] * exchangeRates[currencyTarget])
          .toStringAsFixed(2)
          .toString();
  return result;
}
