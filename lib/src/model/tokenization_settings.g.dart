// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokenization_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenizationSettings _$TokenizationSettingsFromJson(Map<String, dynamic> json) {
  return TokenizationSettings(
    paymentMethodTypes:
        _$enumDecode(_$PaymentMethodTypesEnumMap, json['paymentMethodTypes']),
    showYooKassaLogo: json['showYooKassaLogo'] as bool,
  );
}

Map<String, dynamic> _$TokenizationSettingsToJson(
        TokenizationSettings instance) =>
    <String, dynamic>{
      'paymentMethodTypes':
          _$PaymentMethodTypesEnumMap[instance.paymentMethodTypes],
      'showYooKassaLogo': instance.showYooKassaLogo,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$PaymentMethodTypesEnumMap = {
  PaymentMethodTypes.all: 'all',
  PaymentMethodTypes.bankCard: 'bankCard',
  PaymentMethodTypes.applePay: 'applePay',
  PaymentMethodTypes.sberbank: 'sberbank',
  PaymentMethodTypes.yooMoney: 'yooMoney',
};
