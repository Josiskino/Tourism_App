
class Transactions {
  int transactionNumber;
  DateTime transactionDateTime;
  String recepient;
  String sender;
  String amountSend;
  DateTime? completedOn;
  String? transactionRef;
  String transactionStatus;
  String? transactionMethod;
  String transactionType;
  String? error;
  String message;

  Transactions({
    required this.transactionNumber,
    required this.transactionDateTime,
    required this.recepient,
    required this.sender,
    required this.amountSend,
    this.completedOn,
    this.transactionRef,
    required this.transactionStatus,
    this.transactionMethod,
    required this.transactionType,
    this.error,
    required this.message,
  });

  static List<Transactions> transactions() {
    return [
      Transactions(
        transactionNumber: 125866821,
        transactionDateTime: DateTime.now(),
        recepient: 'John Doe',
        sender: 'Jane Smith',
        amountSend: '10000 XOF',
        completedOn: DateTime.now().add(const Duration(hours: 1)),
        transactionRef: 'TXN123456789',
        transactionStatus: 'Completed',
        transactionMethod: 'Tmoney',
        transactionType: 'Transfer',
        error: null,
        message: 'Transaction successful',
      ),
      Transactions(
        transactionNumber: 125866822,
        transactionDateTime: DateTime.now(),
        recepient: 'Alice Johnson',
        sender: 'Bob Brown',
        amountSend: '15000 XOF',
        completedOn: null,
        transactionRef: 'TXN987654321',
        transactionStatus: 'Pending',
        transactionMethod: 'Moov',
        transactionType: 'Payment',
        error: null,
        message: 'Transaction pending',
      ),
      Transactions(
        transactionNumber: 125866823,
        transactionDateTime: DateTime.now(),
        recepient: 'Carlos Santana',
        sender: 'Mike Tyson',
        amountSend: '20000 XOF',
        completedOn: null,
        transactionRef: 'TXN112233445',
        transactionStatus: 'Failed',
        transactionMethod: 'Tmoney',
        transactionType: 'Transfer',
        error: 'Insufficient funds',
        message: 'Transaction failed due to insufficient funds',
      ),
    ];
  }
}
