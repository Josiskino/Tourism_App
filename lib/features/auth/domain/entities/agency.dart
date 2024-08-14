import 'package:equatable/equatable.dart';

class Agency extends Equatable {
  final int id;
  final String email;
  final String role;
  final String agencyName;
  final String agencyResponsibleName;
  final String? agencyAttestation;
  final String? agencyAddress;
  final String? agencyPhone;
  final String? agencyLogo;
  final int status;
  final String createdAt;
  final String updatedAt;

  const Agency({
    required this.id,
    required this.email,
    required this.role,
    required this.agencyName,
    required this.agencyResponsibleName,
    this.agencyAttestation,
    this.agencyAddress,
    this.agencyPhone,
    this.agencyLogo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        role,
        agencyName,
        agencyResponsibleName,
        agencyAttestation,
        agencyAddress,
        agencyPhone,
        agencyLogo,
        status,
        createdAt,
        updatedAt,
  ];
}
