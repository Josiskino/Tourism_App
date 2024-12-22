class PaymentDetails {
  final int status;
  final String statusText;
  final int txReference;
  final Map<String, dynamic> rawResponse;

  PaymentDetails({
    required this.status,
    required this.statusText,
    required this.txReference,
    required this.rawResponse,
  });
}