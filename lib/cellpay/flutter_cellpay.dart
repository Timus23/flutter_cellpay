import 'package:cellpay/cellpay/model/cellpay_config.dart';
import 'package:cellpay/cellpay/model/cellpay_error.dart';
import 'package:cellpay/cellpay/model/cellpay_success.dart';
import 'package:flutter/services.dart';

class FlutterCellPay {
  static const MethodChannel _methodChannel = MethodChannel("com.cellpay.sdk");

  static payViaCellPay(CellpayConfig config) {
    _methodChannel.setMethodCallHandler((call) {
      if (call.method == "cellpay_success") {
        Map<String, dynamic> _successMessage =
            Map<String, dynamic>.from(call.arguments);
        config.onSuccess(CellpaySuccess.fromJson(_successMessage));
      } else if (call.method == "cellpay_error") {
        Map<String, dynamic> _errorMessage =
            Map<String, dynamic>.from(call.arguments);
        config.onError(CellpayError.fromJson(_errorMessage));
      }

      return Future.value({});
    });
    _methodChannel.invokeMethod("init_cellpay", config.toJson());
  }
}
