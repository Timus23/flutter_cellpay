import 'package:cellpay/cellpay/model/cellpay_error.dart';
import 'package:cellpay/cellpay/model/cellpay_success.dart';
import 'package:flutter/material.dart';

class CellpayConfig {
  String publicKey;
  String merchantId;
  String invoiceNumber;
  String description;
  double amount;
  Map<String, String> extra;
  ValueChanged<CellpaySuccess> onSuccess;
  ValueChanged<CellpayError> onError;

  CellpayConfig({
    required this.publicKey,
    required this.merchantId,
    required this.invoiceNumber,
    this.description = "",
    required this.amount,
    this.extra = const <String, String>{},
    required this.onError,
    required this.onSuccess,
  });

  Map<String, dynamic> toJson() {
    return {
      "publicKey": publicKey,
      "merchantId": merchantId,
      "invoiceNumber": invoiceNumber,
      "description": description,
      "amount": amount,
      "extra": extra,
    };
  }
}
