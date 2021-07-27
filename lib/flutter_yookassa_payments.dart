
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterYookassaPayments {
  static const MethodChannel _channel =
      const MethodChannel('flutter_yookassa_payments');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
