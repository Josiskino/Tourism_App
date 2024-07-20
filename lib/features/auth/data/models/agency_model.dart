

import 'package:myapp/features/auth/data/models/user_model.dart';
import 'package:myapp/features/auth/domain/entities/agency.dart';

class AgencyModel extends Agency {

  AgencyModel({
    required super.id,
    required super.user,
    required super.agencyName,
    required super.agencyResponsibleName,
  });

  factory AgencyModel.fromJson(Map<String, dynamic> json) {
    return AgencyModel(
      id: json['id'],
      user: UserModel.fromJson(json['user']),
      agencyName: json['agencyName'],
      agencyResponsibleName: json['agencyResponsibleName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': user.email,
      'role': user.role,
      'agencyName': agencyName,
      'agencyResponsibleName': agencyResponsibleName,
    };
  }

}
