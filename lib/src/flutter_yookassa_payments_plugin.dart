import 'package:flutter/services.dart';
import 'package:flutter_yookassa_payments/flutter_yookassa_payments.dart';
import 'package:flutter_yookassa_payments/src/model/tokenization_module_input_data.dart';

class FlutterYookassaPayments {
  static const MethodChannel _channel =
      const MethodChannel('flutter_yookassa_payments');

  static Future<String> checkout(TokenizationModuleInputData inputData) async {
    final message = inputData.toJson();
    final response = await _channel.invokeMethod('checkout', message);
    return response;
  }

  static Future<void> repeat(BankCardRepeatModuleInputData bankCardRepeatModuleInputData) async {
    final message = bankCardRepeatModuleInputData.toJson();
    await _channel.invokeMethod('repeat', message);
  }
}
