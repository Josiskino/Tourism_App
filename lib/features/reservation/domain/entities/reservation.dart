class Reservation {
  final int? id;
  final String startDate;
  final String? endDate;
  final num amount;
  final String reservableType;
  final int reservableId;
  final int touristId;
  final int status;
  final String? reservationTime;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Reservation({
    this.id,
    required this.startDate,
    this.endDate,
    required this.amount,
    required this.reservableType,
    required this.reservableId,
    required this.touristId,
    required this.status,
    this.reservationTime,
    required this.createdAt,
    required this.updatedAt,
  });
}