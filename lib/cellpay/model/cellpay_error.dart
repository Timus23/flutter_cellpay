class CellpayError {
  String message;

  CellpayError({required this.message});

  factory CellpayError.fromJson(Map<String, dynamic> json) {
    return CellpayError(message: json["message"]);
  }
}
