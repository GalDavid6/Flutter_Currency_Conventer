import 'package:flutter_app_currency_converter/components/converter.dart';
import 'package:flutter_app_currency_converter/functions/exchange_utils.dart';
import 'package:flutter_app_currency_converter/models/ratesmodel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<RatesModel> allRates;
  late Future<Map> allCurrencies;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      allRates = fetchRates();
      allCurrencies = fetchCurrencies();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Currency Converter App')),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: FutureBuilder<RatesModel>(
            future: allRates,
            builder: (context, ratesSnapshot) {
              if (ratesSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return Center(
                child: FutureBuilder<Map>(
                    future: allCurrencies,
                    builder: (context, currSnapshot) {
                      if (currSnapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Converter(
                              currencies: currSnapshot.data!, rates: ratesSnapshot.data!.rates),
                        ],
                      );
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}
