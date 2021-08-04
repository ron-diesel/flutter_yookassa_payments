// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokenization_module_input_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenizationModuleInputData _$TokenizationModuleInputDataFromJson(
    Map<String, dynamic> json) {
  return TokenizationModuleInputData(
    clientApplicationKey: json['clientApplicationKey'] as String,
    shopName: json['shopName'] as String,
    purchaseDescription: json['purchaseDescription'] as String,
    amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
    savePaymentMethod: json['savePaymentMethod'] as String,
    shopId: json['shopId'] as String,
    tokenizationSettings: TokenizationSettings.fromJson(
        json['tokenizationSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TokenizationModuleInputDataToJson(
        TokenizationModuleInputData instance) =>
    <String, dynamic>{
      'clientApplicationKey': instance.clientApplicationKey,
      'shopName': instance.shopName,
      'purchaseDescription': instance.purchaseDescription,
      'amount': instance.amount.toJson(),
      'savePaymentMethod': instance.savePaymentMethod,
      'shopId': instance.shopId,
      'tokenizationSettings': instance.tokenizationSettings.toJson(),
    };
