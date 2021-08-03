import 'package:flutter_yookassa_payments/src/model/amount.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_card_repeat_module_input_data.g.dart';

@JsonSerializable(explicitToJson: true)
class BankCardRepeatModuleInputData {
  final String clientApplicationKey;
  final String shopName;
  final String purchaseDescription;
  final String paymentMethodId;
  final Amount amount;
  final String savePaymentMethod;

  BankCardRepeatModuleInputData({
    required this.clientApplicationKey,
    required this.shopName,
    required this.purchaseDescription,
    required this.paymentMethodId,
    required this.amount,
    required this.savePaymentMethod,
  });

    factory BankCardRepeatModuleInputData.fromJson(Map<String, dynamic> json) =>
      _$BankCardRepeatModuleInputDataFromJson(json);
  Map<String, dynamic> toJson() => _$BankCardRepeatModuleInputDataToJson(this);
}
