

import 'package:myapp/features/auth/domain/entities/agency.dart';

class AgencyModel extends Agency {

  AgencyModel({
    required super.id,
    required super.userId,
    required super.agencyName,
    required super.agencyResponsibleName,
  });

  factory AgencyModel.fromJson(Map<String, dynamic> json) {
    return AgencyModel(
      id: json['id'],
      userId: json['user_id'],
      agencyName: json['agencyName'],
      agencyResponsibleName: json['agencyResponsibleName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'agencyName': agencyName,
      'agencyResponsibleName': agencyResponsibleName,
    };
  }

}
