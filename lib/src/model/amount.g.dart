// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Amount _$AmountFromJson(Map<String, dynamic> json) {
  return Amount(
    value: (json['value'] as num).toDouble(),
    currency: _$enumDecode(_$CurrencyEnumMap, json['currency']),
  );
}

Map<String, dynamic> _$AmountToJson(Amount instance) => <String, dynamic>{
      'value': instance.value,
      'currency': _$CurrencyEnumMap[instance.currency],
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

const _$CurrencyEnumMap = {
  Currency.rub: 'rub',
  Currency.usd: 'usd',
  Currency.eur: 'eur',
};
