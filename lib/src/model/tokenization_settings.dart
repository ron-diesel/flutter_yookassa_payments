import 'package:flutter_yookassa_payments/src/model/payment_method_types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tokenization_settings.g.dart';

@JsonSerializable(explicitToJson: true)
class TokenizationSettings {
  final PaymentMethodTypes paymentMethodTypes;
  final bool showYooKassaLogo;

  const TokenizationSettings({
    this.paymentMethodTypes = PaymentMethodTypes.all,
    this.showYooKassaLogo = true,
  });

  factory TokenizationSettings.fromJson(Map<String, dynamic> json) =>
      _$TokenizationSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$TokenizationSettingsToJson(this);
}


