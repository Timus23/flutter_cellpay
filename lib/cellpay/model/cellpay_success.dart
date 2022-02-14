class CellpaySuccess {
  final String referenceId;
  final String merchantInvoiceNumber;
  final String transactionStatus;
  final String merchantAmount;

  CellpaySuccess({
    required this.merchantAmount,
    required this.merchantInvoiceNumber,
    required this.referenceId,
    required this.transactionStatus,
  });

  factory CellpaySuccess.fromJson(Map<String, dynamic> json) {
    return CellpaySuccess(
      merchantAmount: json["merchant_amount"]?.toString() ?? "",
      merchantInvoiceNumber: json["merchant_invoice_number"]?.toString() ?? "",
      referenceId: json["cellpay_ref_id"]?.toString() ?? "",
      transactionStatus: json["cellpay_transaction_status"]?.toString() ?? "",
    );
  }
}
