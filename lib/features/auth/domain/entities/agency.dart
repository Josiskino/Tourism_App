import 'package:equatable/equatable.dart';
import 'package:myapp/features/auth/domain/entities/user.dart';

class Agency extends Equatable {
  
  final int id;
  final User user;
  final String agencyName;
  final String agencyResponsibleName;

  const Agency({
    required this.id,
    required this.user,
    required this.agencyName,
    required this.agencyResponsibleName,
  });
  
  @override
  List<Object?> get props => [id, user, agencyName, agencyResponsibleName];
}
