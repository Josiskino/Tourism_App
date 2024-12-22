class Transaction {
  final int reservationId;
  final String amount;
  final String network;
  final String phoneNumber;
  final String identifier;
  final String? currency;
  final DateTime transactionDate;
  final dynamic transactionDetails;
  final int? status;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int id;
  final int transactionReference;

  Transaction({
    required this.reservationId,
    required this.amount,
    required this.network,
    required this.phoneNumber,
    required this.identifier,
    required this.currency,
    required this.transactionDate,
    this.transactionDetails,
    this.status,
    this.updatedAt,
    this.createdAt,
    required this.id,
    required this.transactionReference,
  });
}