// class PhoneValidator {
//   static const List<String> togocelPrefixes = ['90', '91', '92', '93'];
//   static const List<String> moovPrefixes = ['96', '97', '98', '99'];

//   static const int maxAttempts = 5;
//   static Map<String, int> attemptsByDevice = {};
//   static Map<String, DateTime> blockEndTime = {};

//   /// Vérifie si l'opérateur est valide
//   static bool isOperatorValid(String number, String provider) {
//     if (number.length < 2) return false;
//     final prefix = number.substring(0, 2);

//     if (provider == 'T-Money') {
//       return togocelPrefixes.contains(prefix);
//     } else if (provider == 'Flooz') {
//       return moovPrefixes.contains(prefix);
//     }
//     return false;
//   }

//   /// Méthode pour obtenir un message d'erreur lors de la saisie (sans incrémenter les tentatives)
//   static String? validateInProgress(String number, String provider) {
//     if (number.isEmpty) return 'Veuillez entrer un numéro de téléphone';

//     number = number.replaceAll(RegExp(r'\s+'), '');

//     if (RegExp(r'[^\d]').hasMatch(number)) {
//       return 'Le numéro ne doit contenir que des chiffres';
//     }

//     if (number.length > 8) {
//       return 'Le numéro doit contenir exactement 8 chiffres';
//     }

//     if (number.length == 8 && !isOperatorValid(number, provider)) {
//       return provider == 'T-Money'
//           ? 'Préfixe non valide pour T-Money (90, 91, 92, 93)'
//           : 'Préfixe non valide pour Flooz (96, 97, 98, 99)';
//     }

//     return null; // Aucun problème détecté
//   }

//   /// Méthode de validation complète (utilisée lors de la confirmation)
//   static String? validatePhoneNumber(String number, String provider) {
//     final deviceId = 'DEVICE_ID'; // Remplacer par un vrai identifiant unique

//     if (isDeviceBlocked(deviceId)) {
//       return 'Trop de tentatives. Veuillez réessayer dans quelques minutes.';
//     }

//     number = number.replaceAll(RegExp(r'\s+'), '');

//     if (number.isEmpty) {
//       incrementAttempts(deviceId);
//       return 'Veuillez entrer un numéro de téléphone';
//     }

//     if (RegExp(r'[^\d]').hasMatch(number) || number.length != 8) {
//       incrementAttempts(deviceId);
//       return 'Le numéro doit contenir exactement 8 chiffres et ne contenir que des chiffres';
//     }

//     if (_hasRepeatingSequence(number) || _hasSequentialNumbers(number)) {
//       incrementAttempts(deviceId);
//       return 'Numéro invalide : séquence suspecte détectée';
//     }

//     if (!isOperatorValid(number, provider)) {
//       incrementAttempts(deviceId);
//       return provider == 'T-Money'
//           ? 'Ce numéro n\'est pas un numéro Togocel valide (90, 91, 92, 93)'
//           : 'Ce numéro n\'est pas un numéro Moov valide (96, 97, 98, 99)';
//     }

//     resetAttempts(deviceId); // Réinitialiser si tout va bien
//     return null;
//   }

//   /// Incrémenter les tentatives seulement lors d'erreurs finales
//   static void incrementAttempts(String deviceId) {
//     attemptsByDevice[deviceId] = (attemptsByDevice[deviceId] ?? 0) + 1;

//     if (attemptsByDevice[deviceId]! >= maxAttempts) {
//       blockEndTime[deviceId] = DateTime.now().add(const Duration(minutes: 15));
//     }
//   }

//   static void resetAttempts(String deviceId) {
//     attemptsByDevice.remove(deviceId);
//     blockEndTime.remove(deviceId);
//   }

//   static bool isDeviceBlocked(String deviceId) {
//     final endTime = blockEndTime[deviceId];
//     if (endTime != null && DateTime.now().isBefore(endTime)) {
//       return true;
//     }
//     resetAttempts(deviceId);
//     return false;
//   }

//   static bool _hasRepeatingSequence(String number) {
//     for (int i = 0; i < number.length - 3; i++) {
//       if (number[i] == number[i + 1] &&
//           number[i] == number[i + 2] &&
//           number[i] == number[i + 3]) {
//         return true;
//       }
//     }
//     return false;
//   }

//   static bool _hasSequentialNumbers(String number) {
//     for (int i = 0; i < number.length - 3; i++) {
//       int current = int.parse(number[i]);
//       int next1 = int.parse(number[i + 1]);
//       int next2 = int.parse(number[i + 2]);
//       int next3 = int.parse(number[i + 3]);

//       if ((next1 == current + 1 &&
//               next2 == current + 2 &&
//               next3 == current + 3) ||
//           (next1 == current - 1 &&
//               next2 == current - 2 &&
//               next3 == current - 3)) {
//         return true;
//       }
//     }
//     return false;
//   }
// }

class PhoneValidator {
  static String? validateInProgress(String phone, String provider) {
    if (phone.isEmpty) {
      return 'Veuillez entrer un numéro de téléphone';
    }

    if (phone.length < 8) {
      return 'Le numéro doit contenir 8 chiffres';
    }

    final prefix = phone.substring(0, 2);
    
    if (provider == 'Mixx By YAS') {
      if (!['90', '91', '92', '93', '70'].contains(prefix)) {
        return 'Veuillez entrer un numéro YAS valide (90, 91, 92, 93, 70)';
      }
    } else {
      if (!['96', '97', '98', '99', '77'].contains(prefix)) {
        return 'Veuillez entrer un numéro Moov valide (96, 97, 98, 99, 77)';
      }
    }

    return null;
  }

  static String? validatePhoneNumber(String phone, String provider) {
    return validateInProgress(phone, provider);
  }
}