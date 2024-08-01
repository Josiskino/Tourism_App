// import 'package:flutter_test/flutter_test.dart';
// import 'package:myapp/features/auth/data/models/tourist_model.dart';
// import 'package:myapp/features/auth/data/models/user_model.dart';

// void main() {
//   group('TouristModel', () {
//     final userJson = {
//       'id': 3,
//       'email': 'test2@gmail.com',
//       'role': 'tourist',
//     };

//     final touristJson = {
//       'id': 2,
//       'user': userJson,
//       'touristName': 'Marcus LASSEY',
//     };

//     const userModel = UserModel(
//       id: 3,
//       email: 'test2@gmail.com',
//       role: 'tourist',
//     );

//     const touristModel = TouristModel(
//       id: 2,
//       user: userModel,
//       touristName: 'Marcus LASSEY',
//     );

//     test('fromJson should return a valid model', () {
//       // Act
//       final result = TouristModel.fromJson(touristJson);

//       // Assert
//       expect(result, equals(touristModel));
//     });

//     test('toJson should return a valid JSON map', () {
//       // Act
//       final result = touristModel.toJson();

//       // Assert
//       final expectedJson = {
//         'touristName': 'Marcus LASSEY',
//         'email': 'test2@gmail.com',
//         'role': 'tourist',
//       };

//       expect(result, equals(expectedJson));
//     });
//   });
// }
