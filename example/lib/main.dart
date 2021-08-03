import 'package:flutter/material.dart';
import 'package:flutter_yookassa_payments/flutter_yookassa_payments.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _token = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_token),
              const SizedBox(height: 100),
              TextButton(
                onPressed: () async {
                  final clientApplicationKey =
                      'YOUR_CLIENT_KEY';
                  final shopName = 'YOUR_SHOP_NAME';
                  final purchaseDescription = 'PURCHASE_NAME';

                  final amount = Amount(value: 1, currency: Currency.rub);

                  final tokenizationSettings = TokenizationSettings(
                      paymentMethodTypes: PaymentMethodTypes.bankCard);

                  final inputData = TokenizationModuleInputData(
                      clientApplicationKey: clientApplicationKey,
                      shopName: shopName,
                      purchaseDescription: purchaseDescription,
                      savePaymentMethod: 'on',
                      amount: amount,
                      tokenizationSettings: tokenizationSettings);

                  final token =
                      await FlutterYookassaPayments.checkout(inputData);

                  setState(() {
                    _token = token;
                  });
                },
                child: Text('Tap on me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
