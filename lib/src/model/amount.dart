import 'package:flutter_yookassa_payments/src/model/currency.dart';
import 'package:json_annotation/json_annotation.dart';

part 'amount.g.dart';

@JsonSerializable(explicitToJson: true)
class Amount {
  final double value;
  final Currency currency;

  const Amount({
    required this.value,
    required this.currency,
  });

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);
  Map<String, dynamic> toJson() => _$AmountToJson(this);
}


