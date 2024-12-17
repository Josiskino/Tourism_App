

import '../../domain/entities/reservation.dart';

class ReservationModel extends Reservation {
   ReservationModel({
    super.id,
    required super.startDate,
    super.endDate,
    required super.amount,
    required super.reservableType,
    required super.reservableId,
    required super.touristId,
    required super.status,
    super.reservationTime,
    required super.createdAt,
    required super.updatedAt,
  });

  // Méthode fromJson à implémenter
  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      amount: json['amount'],
      reservableType: json['reservable_type'],
      reservableId: json['reservable_id'],
      touristId: json['tourist_id'],
      status: json['status'],
      reservationTime: json['reservationTime'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Méthode toJson à implémenter
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startDate': startDate,
      'endDate': endDate,
      'amount': amount,
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