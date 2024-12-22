import '../../domain/entities/payment.dart';

class PaymentDetailsModel extends PaymentDetails {
  PaymentDetailsModel({
    required super.status,
    required super.statusText,
    required super.txReference,
    required super.rawResponse,
  });

  factory PaymentDetailsModel.fromJson(Map<String, dynamic> json) {
    return PaymentDetailsModel(
      status: json['status'],
      statusText: json['status_text'],
      txReference: json['tx_reference'],
      rawResponse: json['raw_response'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_text': statusText,
      'tx_reference': txReference,
      'raw_response': rawResponse,
    };
  }
}