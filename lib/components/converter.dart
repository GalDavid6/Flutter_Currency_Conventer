import 'package:flutter_app_currency_converter/functions/exchange_utils.dart';
import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  final Map currencies;
  final rates;
  const Converter({Key? key, required this.rates, required this.currencies}) : super(key: key);

  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  TextEditingController amountController = TextEditingController();
  String answer = '';
  String dropdownValue1 = "ILS";
  String dropdownValue2 = "USD";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hi, Enter the desired amount to convert',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            TextFormField(
              key: ValueKey('amount'),
              controller: amountController,
              decoration: InputDecoration(hintText: "Enter amount, number only."),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownValue1,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue1 = newValue!;
                      });
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(margin: EdgeInsets.symmetric(horizontal: 20), child: Text('To')),
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownValue2,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    answer =
                        '${amountController.text} $dropdownValue1 => ${convert(widget.rates, amountController.text, dropdownValue1, dropdownValue2)} $dropdownValue2';
                  });
                },
                child: Text('Convert'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ),
            SizedBox(width: 10),
            SizedBox(height: 10),
            Container(child: Text(answer))
          ],
        ),
      ),
    );
  }
}
