import '../../domain/entities/reservation.dart';

class ReservationModel extends Reservation {
  ReservationModel({
    super.id,
    required super.startDate,
    super.endDate,
    required super.amount,
    required super.numberOfPersons,
    required super.reservableType,
    required super.reservableId,
    required super.touristId,
    required super.status,
    super.reservationTime,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'],
      startDate: json['startDate'] ?? '', 
      endDate: json['endDate'], 
      amount: double.parse(json['amount']?.toString() ?? '0' ) , 
      numberOfPersons: json['number_of_persons'] ?? 0,
      reservableType: json['reservable_type'] ?? '', 
      reservableId: json['reservable_id'] ?? 0,
      touristId: json['tourist_id'] ?? 0,
      status: json['status'] ?? 0,
      reservationTime: json['reservationTime'],
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : DateTime.now(),
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startDate': startDate,
      'endDate': endDate,
      'amount': amount,
      'number_of_persons': numberOfPersons,
      'reservable_type': reservableType,
      'reservable_id': reservableId,
      'tourist_id': touristId,
      'status': status,
      'reservationTime': reservationTime,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}