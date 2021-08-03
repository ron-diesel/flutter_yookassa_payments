// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_card_repeat_module_input_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankCardRepeatModuleInputData _$BankCardRepeatModuleInputDataFromJson(
    Map<String, dynamic> json) {
  return BankCardRepeatModuleInputData(
    clientApplicationKey: json['clientApplicationKey'] as String,
    shopName: json['shopName'] as String,
    purchaseDescription: json['purchaseDescription'] as String,
    paymentMethodId: json['paymentMethodId'] as String,
    amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
    savePaymentMethod: json['savePaymentMethod'] as String,
  );
}

Map<String, dynamic> _$BankCardRepeatModuleInputDataToJson(
        BankCardRepeatModuleInputData instance) =>
    <String, dynamic>{
      'clientApplicationKey': instance.clientApplicationKey,
      'shopName': instance.shopName,
      'purchaseDescription': instance.purchaseDescription,
      'paymentMethodId': instance.paymentMethodId,
      'amount': instance.amount.toJson(),
      'savePaymentMethod': instance.savePaymentMethod,
    };
