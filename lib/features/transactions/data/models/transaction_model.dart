import '../../domain/entities/transaction.dart';
import 'payment_model.dart';

class TransactionModel extends Transaction {
  final String message;
  final PaymentDetailsModel paymentDetails;

  TransactionModel({
    required this.message,
    required this.paymentDetails,
    required super.reservationId,
    required super.amount,
    required super.network,
    required super.phoneNumber,
    required super.identifier,
    super.currency,
    required super.transactionDate, 
    super.transactionDetails,
    super.status,
    super.updatedAt,
    super.createdAt,
    required super.id,
    required super.transactionReference,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      message: json['message'] ?? '',
      reservationId: json['transaction']['reservation_id'],
      amount: json['transaction']['amount'],
      network: json['transaction']['network'],
      phoneNumber: json['transaction']['phone_number'],
      identifier: json['transaction']['identifier'],
      currency: json['transaction']['currency'],
      transactionDate: json['transaction']['transaction_date'] != null 
          ? DateTime.parse(json['transaction']['transaction_date']) 
          : DateTime.now(), 
      transactionDetails: json['transaction']['transaction_details'],
      status: json['transaction']['status'],
      updatedAt: json['transaction']['updated_at'] != null 
          ? DateTime.parse(json['transaction']['updated_at']) 
          : null,
      createdAt: json['transaction']['created_at'] != null 
          ? DateTime.parse(json['transaction']['created_at']) 
          : null,
      id: json['transaction']['id'],
      transactionReference: json['transaction']['transaction_reference'],
      paymentDetails: PaymentDetailsModel.fromJson(json['payment_details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'transaction': {
        'reservation_id': reservationId,
        'amount': amount,
        'network': network,
        'phone_number': phoneNumber,
        'identifier': identifier,
        'currency': currency,
        'transaction_date': transactionDate.toIso8601String(), 
        'transaction_details': transactionDetails,
        'status': status,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
        'transaction_reference': transactionReference,
      },
      'payment_details': paymentDetails.toJson(),
    };
  }
}