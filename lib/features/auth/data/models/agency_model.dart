import 'package:myapp/features/auth/domain/entities/agency.dart';

class AgencyModel extends Agency {
  const AgencyModel({
    required super.id,
    required super.email,
    required super.role,
    required super.agencyName,
    required super.agencyResponsibleName,
    super.agencyAttestation,
    super.agencyAddress,
    super.agencyPhone,
    super.agencyLogo,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
  });

  factory AgencyModel.fromJson(Map<String, dynamic> json) {
    return AgencyModel(
      id: json['id'] as int,
      email: json['email'] as String,
      role: json['role'] as String,
      agencyName: json['agencyName'] as String,
      agencyResponsibleName: json['agencyResponsibleName'] as String,
      agencyAttestation: json['agencyAttestation'] as String?,
      agencyAddress: json['agencyAddress'] as String?,
      agencyPhone: json['agencyPhone'] as String?,
      agencyLogo: json['agencyLogo'] as String?,
      status: json['status'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'role': role,
      'agencyName': agencyName,
      'agencyResponsibleName': agencyResponsibleName,
      'agencyAttestation': agencyAttestation,
      'agencyAddress': agencyAddress,
      'agencyPhone': agencyPhone,
      'agencyLogo': agencyLogo,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
