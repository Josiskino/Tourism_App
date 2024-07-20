import 'package:myapp/features/auth/domain/entities/user.dart';

class Agency {
  
  final int id;
  final User user;
  final String agencyName;
  final String agencyResponsibleName;

  Agency({
    required this.id,
    required this.user,
    required this.agencyName,
    required this.agencyResponsibleName,
  });
}
