import '../../domain/entities/agency.dart';
import '../../domain/entities/tourist.dart';

class UserType {
  final dynamic userModel;
  final String userType;

  UserType({required this.userModel, required this.userType});

  // // Méthodes pour vérifier et obtenir le modèle spécifique
  // bool get isAgency => userType == 'Agency' && userModel is Agency;
  // bool get isTourist => userType == 'Tourist' && userModel is Tourist;

  // Agency? get asAgency => isAgency ? userModel as Agency : null;
  // Tourist? get asTourist => isTourist ? userModel as Tourist : null;
}
