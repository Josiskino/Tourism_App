import 'package:equatable/equatable.dart';
import 'package:myapp/features/auth/domain/entities/user.dart';

class Tourist extends Equatable {
  final int id;
  final User user;
  final String touristName;

  const Tourist({
    required this.id,
    required this.user,
    required this.touristName,
  });
  
  @override
  List<Object?> get props => [id, user, touristName];
}
