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
                      'test_NzkxMjAyOuwoQvAL05i8dH3PKX66eL-iT7wMMQHCZmk';
                  final shopName = 'Test, 768482';
                  final purchaseDescription = 'Поездка';

                  final amount = Amount(value: 1, currency: Currency.rub);

                  final tokenizationSettings = TokenizationSettings(
                      paymentMethodTypes: PaymentMethodTypes.bankCard);

                  final inputData = TokenizationModuleInputData(
                    clientApplicationKey: clientApplicationKey,
                    shopName: shopName,
                    purchaseDescription: purchaseDescription,
                    savePaymentMethod: 'on',
                    amount: amount,
                    tokenizationSettings: tokenizationSettings,
                    shopId: '768482',
                  );

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
