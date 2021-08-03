import 'package:flutter_yookassa_payments/src/model/amount.dart';
import 'package:flutter_yookassa_payments/src/model/tokenization_settings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tokenization_module_input_data.g.dart';

@JsonSerializable(explicitToJson: true)
class TokenizationModuleInputData {
  final String clientApplicationKey;
  final String shopName;
  final String purchaseDescription;
  final Amount amount;
  final String savePaymentMethod;
  final TokenizationSettings tokenizationSettings;

  const TokenizationModuleInputData({
    required this.clientApplicationKey,
    required this.shopName,
    required this.purchaseDescription,
    required this.amount,
    required this.savePaymentMethod,
    this.tokenizationSettings = const TokenizationSettings(),
  });

  factory TokenizationModuleInputData.fromJson(Map<String, dynamic> json) =>
      _$TokenizationModuleInputDataFromJson(json);
  Map<String, dynamic> toJson() => _$TokenizationModuleInputDataToJson(this);
}
